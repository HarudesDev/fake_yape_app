import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:flutter/material.dart';

import 'package:fake_yape_app/shared/style.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

@RoutePage()
class YapeDirectoryPage extends StatefulWidget {
  const YapeDirectoryPage({super.key, required this.contacts});
  final List<Contact> contacts;

  @override
  State<YapeDirectoryPage> createState() => _YapeDirectoryPageState();
}

class _YapeDirectoryPageState extends State<YapeDirectoryPage> {
  String _filterString = "";

  List<Contact> filteredContacts = [];

  @override
  void initState() {
    filteredContacts = [
      ...widget.contacts.where((contact) {
        return isPeruvianNumber(contact.phones[0]);
      })
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Yapear"),
          bottom: const TabBar(
            tabs: [
              MakeYapeTab(tabText: "Contactos"),
              MakeYapeTab(tabText: "Yapeos pendientes"),
            ],
            labelPadding: EdgeInsets.all(0),
          ),
          backgroundColor: Colors.white,
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 4.0,
                    shadowColor: Colors.grey[100],
                    child: TextField(
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        hintText: "Ingresa el celular o busca contacto",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _filterString = value;
                          filteredContacts = widget.contacts.where((contact) {
                            final contactNameContains = contact.name.first
                                .toLowerCase()
                                .contains(_filterString.toLowerCase());
                            final contactNumberContains = contact
                                .phones[0].normalizedNumber
                                .contains(_filterString);
                            return (contactNameContains ||
                                    contactNumberContains) &&
                                isPeruvianNumber(contact.phones[0]);
                          }).toList();
                        });
                      },
                    ),
                  ),
                ),
                _filterString.length != 9
                    ? Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            final contact = filteredContacts[index];
                            return Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    AutoRouter.of(context)
                                        .push(MakeYapeRoute(contact: contact));
                                  },
                                  title:
                                      Text(filteredContacts[index].displayName),
                                  subtitle: Text(formatNormalizedNumber(
                                      contact.phones[0])),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Divider(),
                                ),
                              ],
                            );
                          },
                          itemCount: filteredContacts.length,
                        ),
                      )
                    : ListTile(
                        title: const Text("Nuevo contacto"),
                        subtitle: Text(_filterString),
                      ),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/welcome_page_1.png'),
                  const Text("No tienes pagos pendientes"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isPeruvianNumber(Phone contactPhone) =>
      contactPhone.normalizedNumber.isEmpty
          ? false
          : (contactPhone.normalizedNumber.substring(0, 4) == "+519");

  String formatNormalizedNumber(Phone contactPhone) =>
      "${contactPhone.normalizedNumber.substring(3, 6)} "
      "${contactPhone.normalizedNumber.substring(6, 9)} "
      "${contactPhone.normalizedNumber.substring(9)}";
}

class MakeYapeTab extends StatelessWidget {
  const MakeYapeTab({super.key, required this.tabText});

  final String tabText;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            tabText,
            style: const TextStyle(
              color: mainColor,
            ),
          ),
        ),
      ),
    );
  }
}
