import 'package:fake_yape_app/auth/pages/secure_keyboard.dart';
import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:flutter/material.dart';

import 'package:fake_yape_app/shared/style.dart';
import 'package:gap/gap.dart';
import 'package:auto_route/auto_route.dart';

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
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
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

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();

  String _email = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: mainColor,
                ),
              ),
              hintText: 'Correo electrónico',
            ),
            onChanged: (value) {
              setState(() {
                _email = value;
              });
            },
            validator: (value) =>
                RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!)
                    ? null
                    : 'Ingrese un correo electrónico válido',
          ),
          const Gap(20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _loginFormKey.currentState == null ||
                      !_loginFormKey.currentState!.validate()
                  ? null
                  : () {
                      AutoRouter.of(context).push(
                        SecureKeyboardRoute(
                          parameters: {'email': _email},
                          pageType: SecureKeyboardPageType.loginPage,
                        ),
                      );
                    },
              style: ButtonStyle(
                shape: getRoundedRectangleBorder(10.0),
                backgroundColor: const WidgetStatePropertyAll(secondaryColor),
              ),
              child: const Text(
                "CONTINUAR",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
