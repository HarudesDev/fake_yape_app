import 'package:auto_route/auto_route.dart';
import 'package:fake_yape_app/auth/pages/register_data_page/register_data_form.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

@RoutePage()
class RegisterDataPage extends StatelessWidget {
  const RegisterDataPage({super.key, required this.phoneNumber});

  final String phoneNumber;

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
                child: RegisterDataForm(phoneNumber: phoneNumber)),
          ),
        ],
      ),
    );
  }
}
