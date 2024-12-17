import 'dart:developer';

import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gap/gap.dart';
import 'package:flutter_regex/flutter_regex.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String phoneNumber = "";

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(),
                      validator: (value) {
                        if (value != null) {
                          if (isPeruvianPhoneNumber(value)) return null;
                        }
                        return 'Formato de número celular no válido';
                      },
                      onChanged: (value) {
                        phoneNumber = value;
                        log(phoneNumber);
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _formKey.currentState != null &&
                                _formKey.currentState!.validate()
                            ? () {
                                if (isPeruvianPhoneNumber(phoneNumber)) {
                                  AutoRouter.of(context).push(
                                    RegisterDataRoute(phoneNumber: phoneNumber),
                                  );
                                }
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

  bool isPeruvianPhoneNumber(String number) =>
      number.isNumeric() && number.length == 9 && number[0] == '9';
}
