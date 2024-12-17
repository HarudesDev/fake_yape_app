import 'package:fake_yape_app/auth/pages/secure_keyboard_page/secure_keyboard.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gap/gap.dart';

enum SecureKeyboardPageType {
  loginPage,
  passwordPage,
  passwordConfirmPage,
}

@RoutePage()
class SecureKeyboardPage extends StatelessWidget {
  const SecureKeyboardPage(
      {super.key, required this.parameters, required this.pageType});

  final Map<String, dynamic> parameters;
  final SecureKeyboardPageType pageType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: mainColor,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Gap(10),
            Column(
              children: [
                Image.asset(
                  'assets/images/secure_keyboard.png',
                  width: 80,
                ),
                const Gap(10),
                Text(
                  pageType == SecureKeyboardPageType.loginPage
                      ? "Ingresa tu clave Yape"
                      : pageType == SecureKeyboardPageType.passwordPage
                          ? "Crea tu clave Yape"
                          : "Confirma tu clave Yape",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(10),
                const Text(
                  "Clave de 6 dígitos",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SecureKeyboard(
              parameters: parameters,
              pageType: pageType,
            ),
          ],
        ),
      ),
    );
  }
}
