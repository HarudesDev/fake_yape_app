// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:fake_yape_app/auth/pages/welcome_page/welcome_page.dart';
import 'package:fake_yape_app/home/pages/home_page/home_page.dart';
import 'package:fake_yape_app/shared/providers/auth_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Wrapper extends ConsumerStatefulWidget {
  const Wrapper({super.key});

  @override
  ConsumerState<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends ConsumerState<Wrapper> {
  final supabase = Supabase.instance.client;
  @override
  void initState() {
    super.initState();
    supabase.auth.onAuthStateChange.listen((event) async {
      if (event.event == AuthChangeEvent.signedIn) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateChangeProvider);

    return authState.when(
        data: (user) {
          print(user.event.name);
          if (user.session != null) {
            print(user.session!.accessToken);
            print(JwtDecoder.isExpired(user.session!.accessToken));
            print(JwtDecoder.getExpirationDate(user.session!.accessToken));
          }
          if (user.event.name == "tokenRefreshed") {
            print("Token refreshed");
            Supabase.instance.client.auth.signOut();
            return const HomePage();
          }
          return user.session == null ? const WelcomePage() : const HomePage();
        },
        error: (error, _) => Text('Error:$error'),
        loading: () => const CircularProgressIndicator());
  }
}
