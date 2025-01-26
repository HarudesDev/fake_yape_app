import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:auto_route/auto_route.dart';

import 'package:fake_yape_app/shared/style.dart';

import 'login_form.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [mainColor, mainColorDark, mainColorDark, mainColorDark],
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(0, 300, 0, 0),
            shrinkWrap: true,
            reverse: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 635,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 20,
                          ),
                          child: Column(
                            children: [
                              const Text(
                                "Ingresa a tu Yape",
                                style: TextStyle(
                                  color: mainColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "¿Todavía no te registraste? ",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    InkWell(
                                      child: const Text(
                                        "Crea tu Yape aquí",
                                        style: TextStyle(
                                          color: secondaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(30),
                              const LoginForm(),
                              const Gap(30),
                              const Divider(),
                              const Gap(30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: const Icon(Icons.lock_outline),
                                      ),
                                      const Text(
                                        "Olvidé mi\n clave o correo",
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        child:
                                            const Icon(Icons.screen_rotation),
                                      ),
                                      const Text(
                                        "Cambié mi\n número",
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Gap(30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("¿Dudas? "),
                                  InkWell(
                                    onTap: () {},
                                    child: const Text(
                                      "Ingresa al Centro de Ayuda",
                                      style: TextStyle(
                                        color: secondaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
