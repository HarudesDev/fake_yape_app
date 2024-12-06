import 'dart:developer';

import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

class SecureKeyboard extends StatefulWidget {
  const SecureKeyboard(
      {super.key, required this.parameters, required this.pageType});

  final Map<String, dynamic> parameters;
  final SecureKeyboardPageType pageType;
  @override
  State<SecureKeyboard> createState() => _SecureKeyboardState();
}

class _SecureKeyboardState extends State<SecureKeyboard> {
  String _password = "";
  final _supaBase = Supabase.instance.client;

  List<String> keyNumbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  Future<void> _signIn() async {
    try {
      await _supaBase.auth.signInWithPassword(
        email: widget.parameters['email'],
        password: _password,
      );
      if (mounted) {
        log("Ingreso exitoso");
      }
    } on AuthException catch (error) {
      log(error.message);
    } catch (error) {
      if (mounted) {
        log('Unexpected error occurred');
      }
    } finally {
      log(_supaBase.auth.currentUser != null
          ? _supaBase.auth.currentUser!.id
          : "Sin acceder");
    }
    if (mounted) {
      AutoRouter.of(context).popUntilRoot();
    }
  }

  Future<void> _register() async {
    log("loading");
    final parameters = widget.parameters;
    if (_password != parameters['password']) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Las contraseñas no coinciden')),
        );
      }
      return;
    }
    try {
      final authStatus = await _supaBase.auth.signUp(
        password: _password,
        email: parameters['email'],
        data: {
          'documentType': parameters['documentType'],
          'documentNumber': parameters['documentNumber'],
          'fullName': parameters['fullName'],
        },
      );

      if (authStatus.user != null) {
        log(authStatus.user!.id);
        await _supaBase.from('users').insert({
          'fullname': parameters['fullName'],
          'phone_number': parameters['phoneNumber'],
          'account_balance': 500,
          'auth_service_id': authStatus.user!.id,
        });
        if (mounted) {
          AutoRouter.of(context).popUntilRoot();
        }
      }
    } on AuthException catch (error) {
      log('Auth error occurred');
      log(error.message);
    } on PostgrestException catch (error) {
      log('Database error occurred');
      log(error.message);
    } catch (error) {
      log('Unexpected error occurred');
      log(error.toString());
    } finally {
      log('Register finished');
    }
  }

  void onKeyPress(int pos) {
    _password += keyNumbers[pos];
    log(_password);
    if (_password.length >= 6) {
      switch (widget.pageType) {
        case SecureKeyboardPageType.loginPage:
          _signIn();
          break;
        case SecureKeyboardPageType.passwordPage:
          final parameters = Map<String, String>.from(widget.parameters);
          parameters['password'] = _password;
          AutoRouter.of(context).push(SecureKeyboardRoute(
            parameters: parameters,
            pageType: SecureKeyboardPageType.passwordConfirmPage,
          ));
          break;
        case SecureKeyboardPageType.passwordConfirmPage:
          _register();
          break;
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    late final List<String> requiredParameters;
    switch (widget.pageType) {
      case SecureKeyboardPageType.loginPage:
        requiredParameters = ['email'];
        break;
      case SecureKeyboardPageType.passwordPage:
        requiredParameters = [
          'email',
          'phoneNumber',
          'documentType',
          'documentNumber',
          'fullName',
        ];
        break;
      case SecureKeyboardPageType.passwordConfirmPage:
        requiredParameters = [
          'email',
          'phoneNumber',
          'documentType',
          'documentNumber',
          'fullName',
          'password',
        ];
        break;
    }
    for (var parameter in requiredParameters) {
      if (!widget.parameters.containsKey(parameter)) {
        AutoRouter.of(context).back();
      }
    }
    keyNumbers.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [1, 2, 3, 4, 5, 6].map((value) {
              return Icon(
                Icons.circle,
                color:
                    _password.length >= value ? secondaryColor : mainColorLight,
                size: 17.5,
              );
            }).toList(),
          ),
        ),
        const Gap(10),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 50),
          child: Column(
            children: [
              Row(
                children: [
                  SecureKeyboardKey(
                    keyNumber: keyNumbers[0],
                    onPress: () => onKeyPress(0),
                  ),
                  SecureKeyboardKey(
                    keyNumber: keyNumbers[1],
                    onPress: () => onKeyPress(1),
                  ),
                  SecureKeyboardKey(
                    keyNumber: keyNumbers[2],
                    onPress: () => onKeyPress(2),
                  ),
                ],
              ),
              Row(
                children: [
                  SecureKeyboardKey(
                    keyNumber: keyNumbers[3],
                    onPress: () => onKeyPress(3),
                  ),
                  SecureKeyboardKey(
                    keyNumber: keyNumbers[4],
                    onPress: () => onKeyPress(4),
                  ),
                  SecureKeyboardKey(
                    keyNumber: keyNumbers[5],
                    onPress: () => onKeyPress(5),
                  ),
                ],
              ),
              Row(
                children: [
                  SecureKeyboardKey(
                    keyNumber: keyNumbers[6],
                    onPress: () => onKeyPress(6),
                  ),
                  SecureKeyboardKey(
                    keyNumber: keyNumbers[7],
                    onPress: () => onKeyPress(7),
                  ),
                  SecureKeyboardKey(
                    keyNumber: keyNumbers[8],
                    onPress: () => onKeyPress(8),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  SecureKeyboardKey(
                    keyNumber: keyNumbers[9],
                    onPress: () => onKeyPress(9),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        if (_password.isNotEmpty) {
                          _password =
                              _password.substring(0, _password.length - 1);
                        }
                        log(_password);
                        setState(() {});
                      },
                      icon: const Icon(Icons.backspace_rounded),
                      color: const Color.fromRGBO(224, 178, 232, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SecureKeyboardKey extends StatelessWidget {
  const SecureKeyboardKey({
    super.key,
    required this.keyNumber,
    required this.onPress,
  });
  final String keyNumber;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
            onPressed: onPress,
            style: ButtonStyle(
              shape: getRoundedRectangleBorder(10),
              backgroundColor: const WidgetStatePropertyAll(mainColorLight),
            ),
            child: Text(
              keyNumber,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
