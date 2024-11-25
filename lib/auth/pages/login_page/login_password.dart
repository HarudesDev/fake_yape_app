import 'dart:developer';

import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@RoutePage()
class LoginPasswordPage extends StatefulWidget {
  const LoginPasswordPage({super.key, required this.email});

  final String email;
  @override
  State<LoginPasswordPage> createState() => _LoginPasswordPageState();
}

class _LoginPasswordPageState extends State<LoginPasswordPage> {
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
          children: [
            const Gap(100),
            const Text("Ingresa tu clave Yape"),
            const Text("Clave de 6 dígitos"),
            const Gap(150),
            SecureKeyboard(email: widget.email),
          ],
        ),
      ),
    );
  }
}

class SecureKeyboard extends StatefulWidget {
  const SecureKeyboard({super.key, required this.email});

  final String email;

  @override
  State<SecureKeyboard> createState() => _SecureKeyboardState();
}

class _SecureKeyboardState extends State<SecureKeyboard> {
  final String _password = "";
  final _supaBase = Supabase.instance.client;

  Future<void> _signIn() async {
    try {
      await _supaBase.auth.signInWithPassword(
        email: widget.email,
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [1, 2, 3, 4, 5, 6].map((value) {
            return const Icon(Icons.circle);
          }).toList(),
        ),
      ],
    );
  }
}
