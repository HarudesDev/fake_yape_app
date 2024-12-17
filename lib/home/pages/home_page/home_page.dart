import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:fake_yape_app/shared/providers/yapeos_provider.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';

import 'home_components.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //final future = Supabase.instance.client.from('countries').select();

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [mainColor, mainColorDark],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Row(
              children: [
                InkWell(
                  onTap: () {
                    AutoRouter.of(context).push(MenuRoute());
                  },
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "Hola, nombre usuario",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            actions: [
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.headset_mic_outlined,
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuxiliaryButton(
                    imageUrl: "assets/images/welcome_page_1.png",
                    buttonText: "Recargar \ncelular",
                  ),
                  AuxiliaryButton(
                    imageUrl: "assets/images/welcome_page_1.png",
                    buttonText: "Yapear \nservicios",
                  ),
                  AuxiliaryButton(
                    imageUrl: "assets/images/welcome_page_1.png",
                    buttonText: "Créditos",
                  ),
                  AuxiliaryButton(
                    imageUrl: "assets/images/welcome_page_1.png",
                    buttonText: "Código de \naprobación",
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuxiliaryButton(
                    imageUrl: "assets/images/welcome_page_1.png",
                    buttonText: "Promos",
                  ),
                  AuxiliaryButton(
                    imageUrl: "assets/images/welcome_page_1.png",
                    buttonText: "Tienda",
                  ),
                  AuxiliaryButton(
                    imageUrl: "assets/images/welcome_page_1.png",
                    buttonText: "Cambiar \ndólares",
                  ),
                  AuxiliaryButton(
                    imageUrl: "assets/images/welcome_page_1.png",
                    buttonText: "Ver más",
                  ),
                ],
              ),
              const Gap(10),
              Expanded(
                child: ListView(
                  children: const [
                    //todo: reemplazar la SizedBox por el carrusel
                    Gap(50),
                    TransactionsList(),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            child: SizedBox.expand(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        AutoRouter.of(context).push(const QrReaderRoute());
                      },
                      label: const Text(
                        "Escanear QR",
                        style: TextStyle(
                          color: secondaryColor,
                        ),
                      ),
                      icon: const Icon(
                        Icons.qr_code,
                        color: secondaryColor,
                      ),
                      style: ButtonStyle(
                        minimumSize: const WidgetStatePropertyAll(
                          Size(175, 45),
                        ),
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.white),
                        elevation: const WidgetStatePropertyAll(0),
                        side: const WidgetStatePropertyAll(
                          BorderSide(color: secondaryColor),
                        ),
                        shape: getRoundedRectangleBorder(5),
                      ),
                    ),
                  ),
                  SizedBox(
                    //TODO implementar navegación
                    child: OutlinedButton.icon(
                      onPressed: () async {
                        final permissionStatus =
                            await Permission.contacts.request();
                        if (!permissionStatus.isGranted) {
                          log("Permisos no concedidos");
                        } else {
                          final contacts = await FlutterContacts.getContacts(
                              withProperties: true);
                          print(contacts[0]);
                          if (context.mounted) {
                            AutoRouter.of(context)
                                .push(YapeDirectoryRoute(contacts: contacts));
                          }
                        }
                      },
                      label: const Text(
                        "Yapear",
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                        minimumSize: const WidgetStatePropertyAll(
                          Size(175, 45),
                        ),
                        backgroundColor:
                            const WidgetStatePropertyAll(secondaryColor),
                        elevation: const WidgetStatePropertyAll(0),
                        side: const WidgetStatePropertyAll(
                          BorderSide(color: secondaryColor),
                        ),
                        shape: getRoundedRectangleBorder(5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}