import 'package:fake_yape_app/shared/auto_router.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://hucmutcebtbdehcqbcxt.supabase.co',
    // cSpell:disable
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdX"
        "BhYmFzZSIsInJlZiI6Imh1Y211dGNlYnRiZG"
        "VoY3FiY3h0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3"
        "MzI2NzU5MTksImV4cCI6MjA0ODI1MTkxOX0.N5Y"
        "Fy6AbOFb6WGLo-ykwSKZ1MozUlIY6CZdvrU7S9xM",
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
