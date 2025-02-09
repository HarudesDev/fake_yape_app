import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:fake_yape_app/auth/pages/secure_keyboard_page/secure_keyboard_components.dart';
import 'package:fake_yape_app/auth/pages/secure_keyboard_page/secure_keyboard_page.dart';
import 'package:fake_yape_app/auth/repositories/supabase_auth_repository.dart';
import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:fake_yape_app/yape/repositories/supabase_database_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SecureKeyboard extends ConsumerStatefulWidget {
  const SecureKeyboard(
      {super.key, required this.parameters, required this.pageType});

  final Map<String, dynamic> parameters;
  final SecureKeyboardPageType pageType;
  @override
  ConsumerState<SecureKeyboard> createState() => _SecureKeyboardState();
}

class _SecureKeyboardState extends ConsumerState<SecureKeyboard> {
  String _password = "";
  static const _secureStorage = FlutterSecureStorage();
  final supabase = Supabase.instance.client;

  List<String> keyNumbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  Future<void> _setFcmToken(String fcmToken) async {
    final userId = supabase.auth.currentUser?.id;
    if (userId != null) {
      await supabase
          .from('users')
          .update({'fcm_token': fcmToken}).eq('auth_service_id', userId);
    }
  }

  Future<void> _writeDataInSecureStorage(
      String phoneNumber, String fullName) async {
    await _secureStorage.write(key: "email", value: widget.parameters['email']);
    await _secureStorage.write(key: "password", value: _password);
    await _secureStorage.write(
        key: "QRData",
        value: '{"phoneNumber":"+51$phoneNumber"'
            ',"userName":"$fullName"}');
  }

  Future<void> _signIn() async {
    final authRepository = ref.read(supabaseAuthRepositoryProvider);
    try {
      final response = await authRepository.signIn(
        widget.parameters['email'],
        _password,
      );
      if (mounted && response.session != null) {
        final userData = response.user!.userMetadata!;
        _writeDataInSecureStorage(
            userData['phoneNumber'], userData['fullName']);
        AutoRouter.of(context).replaceAll([const HomeRoute()]);
        log("Ingreso exitoso");
        await FirebaseMessaging.instance.requestPermission();

        final fcmToken = await FirebaseMessaging.instance.getToken();
        if (fcmToken != null) {
          _setFcmToken(fcmToken);
        }
      }
    } on AuthException catch (error) {
      log(error.message);
    } catch (error) {
      if (mounted) {
        log('Unexpected error occurred');
      }
    }
  }

  Future<void> _register() async {
    log("loading");
    final parameters = widget.parameters;
    final authRepository = ref.read(supabaseAuthRepositoryProvider);
    final databaseRepository = ref.read(supabaseDatabaseRepositoryProvider);
    if (_password != parameters['password']) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Las contraseñas no coinciden')),
        );
      }
      return;
    }
    try {
      final userData = {
        'phoneNumber': parameters['phoneNumber'],
        'documentType': parameters['documentType'],
        'documentNumber': parameters['documentNumber'],
        'fullName': parameters['fullName'],
      };
      final authStatus = await authRepository.signUp(
        parameters['email'],
        _password,
        userData,
      );

      if (authStatus.user != null) {
        log(authStatus.user!.id);
        await databaseRepository.createUser(
          parameters['fullName'],
          parameters['phoneNumber'],
          authStatus.user!.id,
        );
        _writeDataInSecureStorage(
            userData['phoneNumber'], userData['fullName']);
        if (mounted) {
          AutoRouter.of(context).replaceAll([const HomeRoute()]);
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
