import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:fake_yape_app/shared/components.dart';
import 'package:fake_yape_app/shared/providers/router_provider.dart';
import 'package:fake_yape_app/shared/providers/startup_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  runApp(const ProviderScope(
    child: AppStartupWidget(),
  ));
}

class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.when(
      data: (_) => MyApp(),
      error: (error, _) => MaterialApp(
        home: AppStartupErrorWidget(error: error),
      ),
      loading: () => const MaterialApp(home: AppStartupLoadingWidget()),
    );
  }
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});
  final supabase = Supabase.instance.client;

  Future<void> _setFcmToken(String fcmToken) async {
    final userId = supabase.auth.currentUser?.id;
    if (userId != null) {
      await supabase
          .from('users')
          .update({'fcm_token': fcmToken}).eq('auth_service_id', userId);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autoRouter = ref.read(autoRouterProvider);
    Supabase.instance.client.auth.signOut();
    Supabase.instance.client.auth.onAuthStateChange.listen((authState) {
      if (authState.event.name == "tokenRefreshed") {
        log("Token refreshed");
        Supabase.instance.client.auth.signOut();
      }
    });
    FirebaseMessaging.onMessage.listen((data) {
      log('Notificación recibida');
      final notification = data.notification;
      if (notification != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${notification.title}\n${notification.body}"),
            backgroundColor: const Color.fromRGBO(94, 13, 102, 1),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }
    });
    FirebaseMessaging.instance.onTokenRefresh.listen((event) async {
      _setFcmToken(event);
    });
    return MaterialApp.router(
      routerConfig: autoRouter.config(
        reevaluateListenable: ReevaluateListenable.stream(
          Supabase.instance.client.auth.onAuthStateChange,
        ),
      ),
    );
  }
}
