import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:fake_yape_app/shared/services/yape_service.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'yape_directory_components.dart';

@RoutePage()
class YapeDirectoryPage extends ConsumerStatefulWidget {
  const YapeDirectoryPage({super.key, required this.contacts});
  final List<Contact> contacts;

  @override
  ConsumerState<YapeDirectoryPage> createState() => _YapeDirectoryPageState();
}

class _YapeDirectoryPageState extends ConsumerState<YapeDirectoryPage> {
  String _filterString = "";

  List<Contact> filteredContacts = [];

  @override
  void initState() {
    filteredContacts = [...widget.contacts];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final yapeService = ref.read(yapeServiceProvider);
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
                                yapeService.isPeruvianNumber(contact.phones[0]);
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
                                  title: Text(
                                    filteredContacts[index].displayName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  subtitle: Text(
                                    yapeService.formatNormalizedNumber(
                                      contact.phones[0],
                                      true,
                                    ),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey[500],
                                      fontSize: 12,
                                    ),
                                  ),
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
                        onTap: () {
                          AutoRouter.of(context).push(
                            MakeYapeRoute(
                              contact: Contact(
                                displayName: "Nuevo contacto",
                                phones: [
                                  Phone(
                                    "+51$_filterString",
                                    normalizedNumber: "+51$_filterString",
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        title: const Text(
                          "Nuevo contacto",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          _filterString,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
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
}
