import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:gap/gap.dart';

class LoggedSecureKeyboard extends StatefulWidget {
  const LoggedSecureKeyboard({super.key});

  @override
  State<LoggedSecureKeyboard> createState() => _LoggedSecureKeyboardState();
}

class _LoggedSecureKeyboardState extends State<LoggedSecureKeyboard> {
  String _password = "";

  List<String> keyNumbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  static const _secureStorage = FlutterSecureStorage();
  final _supaBase = Supabase.instance.client;

  final localAuth = LocalAuthentication();

  @override
  void initState() {
    keyNumbers.shuffle();
    super.initState();
  }

  Future<void> _signIn() async {
    final email = await _secureStorage.read(key: "email");
    try {
      final isLogged = await _supaBase.auth.signInWithPassword(
        email: email!,
        password: _password,
      );
      if (mounted && isLogged.session != null) {
        AutoRouter.of(context).replaceAll([const HomeRoute()]);
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
  }

  void onKeyPress(int pos) {
    _password += keyNumbers[pos];
    if (_password.length >= 6) {
      _signIn();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: _password.isNotEmpty
              ? SizedBox(
                  height: 31,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [1, 2, 3, 4, 5, 6].map((value) {
                      return Icon(
                        Icons.circle,
                        color: _password.length >= value
                            ? Colors.grey[800]
                            : Colors.grey[400],
                        size: _password.length >= value ? 17.5 : 13.5,
                      );
                    }).toList(),
                  ),
                )
              : const Text(
                  "Ingresa tu clave",
                  style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
        ),
        const Gap(10),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  LoggedSecureKeyboardKey(
                    keyNumber: keyNumbers[0],
                    onPress: () => onKeyPress(0),
                  ),
                  LoggedSecureKeyboardKey(
                    keyNumber: keyNumbers[1],
                    onPress: () => onKeyPress(1),
                  ),
                  LoggedSecureKeyboardKey(
                    keyNumber: keyNumbers[2],
                    onPress: () => onKeyPress(2),
                  ),
                ],
              ),
              Row(
                children: [
                  LoggedSecureKeyboardKey(
                    keyNumber: keyNumbers[3],
                    onPress: () => onKeyPress(3),
                  ),
                  LoggedSecureKeyboardKey(
                    keyNumber: keyNumbers[4],
                    onPress: () => onKeyPress(4),
                  ),
                  LoggedSecureKeyboardKey(
                    keyNumber: keyNumbers[5],
                    onPress: () => onKeyPress(5),
                  ),
                ],
              ),
              Row(
                children: [
                  LoggedSecureKeyboardKey(
                    keyNumber: keyNumbers[6],
                    onPress: () => onKeyPress(6),
                  ),
                  LoggedSecureKeyboardKey(
                    keyNumber: keyNumbers[7],
                    onPress: () => onKeyPress(7),
                  ),
                  LoggedSecureKeyboardKey(
                    keyNumber: keyNumbers[8],
                    onPress: () => onKeyPress(8),
                  ),
                ],
              ),
              Row(
                children: [
                  //TODO Añadir login biometrico
                  Expanded(
                    child: IconButton(
                      onPressed: () async {
                        localAuth
                            .authenticate(localizedReason: "Ingrese sesión")
                            .then((onValue) async {
                          _secureStorage.read(key: "password").then((value) {
                            if (value != null && value.length == 6) {
                              _password = value;
                              _signIn();
                            } else {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        "Se dio un error al ingresar biométricamente"),
                                  ),
                                );
                              }
                            }
                          });
                        });
                      },
                      icon: const Icon(
                        Icons.tag_faces,
                        color: mainColor,
                        size: 30,
                      ),
                    ),
                  ),
                  LoggedSecureKeyboardKey(
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
                      color: Colors.grey[500],
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

class LoggedSecureKeyboardKey extends StatelessWidget {
  const LoggedSecureKeyboardKey({
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
          height: 50,
          child: ElevatedButton(
            onPressed: onPress,
            style: ButtonStyle(
              shape: getRoundedRectangleBorder(10),
              backgroundColor: WidgetStatePropertyAll(Colors.grey[200]),
              shadowColor: WidgetStatePropertyAll(Colors.grey[200]),
            ),
            child: Text(
              keyNumber,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
