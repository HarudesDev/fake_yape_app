import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:flutter/material.dart';

import 'package:fake_yape_app/shared/style.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class YapeDirectoryPage extends StatefulWidget {
  const YapeDirectoryPage({super.key});

  @override
  State<YapeDirectoryPage> createState() => _YapeDirectoryPageState();
}

class _YapeDirectoryPageState extends State<YapeDirectoryPage> {
  String _filterString = "";

  static final contacts = <Map<String, String>>[
    {
      'contactName': 'Paulo',
      'contactNumber': '974206606',
    },
    {
      'contactName': 'Alejo',
      'contactNumber': '954992599',
    },
    {
      'contactName': 'Vergil',
      'contactNumber': '973204487',
    },
    {
      'contactName': 'Cuucuu',
      'contactNumber': '974578579',
    }
  ];

  List<Map<String, String>> filteredContacts = <Map<String, String>>[
    {
      'contactName': 'Paulo',
      'contactNumber': '974206606',
    },
    {
      'contactName': 'Alejo',
      'contactNumber': '954992599',
    },
    {
      'contactName': 'Vergil',
      'contactNumber': '973204487',
    },
    {
      'contactName': 'Cuucuu',
      'contactNumber': '974578579',
    }
  ];

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
                          filteredContacts = contacts.where((value) {
                            final contactNameContains =
                                value['contactName']!.contains(_filterString);
                            final contactNumberContains =
                                value['contactNumber']!.contains(_filterString);
                            return contactNameContains || contactNumberContains;
                          }).toList();
                        });
                      },
                    ),
                  ),
                ),
                _filterString.length != 9
                    ? Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) => Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  AutoRouter.of(context)
                                      .push(const MakeYapeRoute());
                                },
                                title: Text(
                                    filteredContacts[index]['contactName']!),
                                subtitle: Text(
                                    filteredContacts[index]['contactNumber']!),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Divider(),
                              ),
                            ],
                          ),
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
