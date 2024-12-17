import 'package:auto_route/auto_route.dart';
import 'package:fake_yape_app/auth/pages/secure_keyboard_page/secure_keyboard_page.dart';
import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
