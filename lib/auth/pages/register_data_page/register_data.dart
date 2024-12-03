import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:fake_yape_app/auth/pages/secure_keyboard.dart';
import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_regex/flutter_regex.dart';

@RoutePage()
class RegisterDataPage extends StatefulWidget {
  const RegisterDataPage({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<RegisterDataPage> createState() => _RegisterDataPageState();
}

class _RegisterDataPageState extends State<RegisterDataPage> {
  final _formKey = GlobalKey<FormState>();
  String documentType = "1";
  String email = "";
  String documentNumber = "";
  String fullName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text(
          "Crear cuenta",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
              vertical: 10.0,
            ),
            decoration: const BoxDecoration(color: mainColor),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Registro de celular",
                  style: TextStyle(color: Colors.white),
                ),
                Gap(10.0),
                Text(
                  "Te enviaremos un código de verificación"
                  " por SMS para validar tu número.",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: DropdownMenu(
                        menuStyle: const MenuStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.white),
                        ),
                        initialSelection: "1",
                        width: double.infinity,
                        label: const Text("Tipo de documento"),
                        onSelected: (value) {
                          if (value != null) documentType = value;
                          log(documentType.toString());
                        },
                        dropdownMenuEntries: const [
                          DropdownMenuEntry(value: "1", label: "DNI"),
                          DropdownMenuEntry(value: "2", label: "RUC"),
                          DropdownMenuEntry(
                              value: "3", label: "CE - Carnet de extranjería"),
                          DropdownMenuEntry(
                              value: "4", label: "PAS - Pasaporte"),
                        ],
                      ),
                    ),
                    const Gap(30),
                    TextFormField(
                      onChanged: (value) {
                        documentNumber = value;
                        setState(() {});
                      },
                      validator: (value) => value!.length < 8
                          ? 'Ingrese un documento válido'
                          : null,
                      decoration: const InputDecoration(
                        label: Text("N° documento"),
                      ),
                    ),
                    const Gap(30),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Correo electrónico"),
                      ),
                      validator: (value) =>
                          value!.isEmail(supportTopLevelDomain: true)
                              ? null
                              : 'Ingrese un correo electrónico válido',
                      onChanged: (value) {
                        email = value;
                        setState(() {});
                      },
                    ),
                    const Gap(30),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Nombres y apellidos"),
                      ),
                      validator: (value) => value!.length >= 8
                          ? null
                          : 'Ingrese su nombre completo',
                      onChanged: (value) {
                        fullName = value;
                        setState(() {});
                      },
                    ),
                    const Gap(30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _formKey.currentState != null &&
                                _formKey.currentState!.validate()
                            ? () {
                                final parameters = {
                                  "phoneNumber": widget.phoneNumber,
                                  "documentType": documentType,
                                  "documentNumber": documentNumber,
                                  "email": email,
                                  "fullName": fullName,
                                };
                                AutoRouter.of(context).push(SecureKeyboardRoute(
                                  parameters: parameters,
                                  pageType: SecureKeyboardPageType.passwordPage,
                                ));
                              }
                            : null,
                        child: const Text("CONTINUAR"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
