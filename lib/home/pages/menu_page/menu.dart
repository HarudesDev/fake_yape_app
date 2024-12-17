import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import './menu_components.dart';

@RoutePage()
class MenuPage extends StatelessWidget {
  MenuPage({super.key});

  final _supaBase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [mainColor, mainColorDark],
          begin: Alignment.topCenter,
          end: Alignment.center,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Menú",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  _supaBase.auth.currentUser!.userMetadata!['fullName'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MenuButton(
                    onPressed: () {},
                    buttonIcon: Icons.person_outline,
                    buttonText: "Mi cuenta",
                  ),
                  MenuButton(
                    onPressed: () {
                      AutoRouter.of(context).push(const MenuMyQrRoute());
                    },
                    buttonIcon: Icons.qr_code,
                    buttonText: "Mi QR",
                  ),
                  MenuButton(
                    onPressed: () {},
                    buttonIcon: Icons.settings_outlined,
                    buttonText: "Ajustes",
                  ),
                  MenuButton(
                    onPressed: () {},
                    buttonIcon: Icons.headset_mic_outlined,
                    buttonText: "Ayuda",
                  ),
                ],
              ),
              const Gap(20),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(246, 244, 251, 1),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Categories(),
                    const Gap(60),
                    const Row(
                      children: [
                        Text("Versión Yape: "),
                        Text("3.31.0"),
                      ],
                    ),
                    const Row(
                      children: [
                        Text("Tipo de cuenta:"),
                        Text("Yape con BCP"),
                      ],
                    ),
                    const Text("BANCO DE CRÉDITO DEL PERÚ"),
                    const Row(
                      children: [
                        Text("RUC: "),
                        Text("20100047218"),
                      ],
                    ),
                    const Gap(10),
                    const BottomMenuOptions(
                      optionTitle: "Términos y condiciones",
                      optionIcon: Icons.description_outlined,
                    ),
                    const BottomMenuOptions(
                      optionTitle: "Política de privacidad",
                      optionIcon: Icons.lock_outline,
                    ),
                    InkWell(
                      onTap: () async {
                        await _supaBase.auth.signOut();
                        if (context.mounted) {
                          AutoRouter.of(context).popUntilRoot();
                        }
                      },
                      child: const BottomMenuOptions(
                        optionTitle: "Cerrar sesión",
                        optionIcon: Icons.logout_rounded,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
