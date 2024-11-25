import 'package:fake_yape_app/shared/auto_router.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://enypcohftmyjpxievheb.supabase.co',
    // cSpell:disable
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSI"
        "sInJlZiI6ImVueXBjb2hmdG15anB4aWV2aGVi"
        "Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzIxMTg1MTUsImV4cCI6MjA0NzY5NDU"
        "xNX0.nXo5zokKXNW6JKbO8p_Z9oHhXcZzZu14EJOPHBUHzdU",
  );

  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}
