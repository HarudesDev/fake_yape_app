import 'package:fake_yape_app/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'startup_provider.g.dart';

@Riverpod(keepAlive: true)
Future<void> firebaseApp(Ref ref) =>
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

@Riverpod(keepAlive: true)
Future<void> supabaseApp(Ref ref) => Supabase.initialize(
      url: 'https://hucmutcebtbdehcqbcxt.supabase.co',
      // cSpell:disable
      anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdX"
          "BhYmFzZSIsInJlZiI6Imh1Y211dGNlYnRiZG"
          "VoY3FiY3h0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3"
          "MzI2NzU5MTksImV4cCI6MjA0ODI1MTkxOX0.N5Y"
          "Fy6AbOFb6WGLo-ykwSKZ1MozUlIY6CZdvrU7S9xM",
    );

@Riverpod(keepAlive: true)
Future<void> appStartup(Ref ref) async {
  await ref.watch(firebaseAppProvider.future);
  await ref.watch(supabaseAppProvider.future);
  ref.onDispose(() {
    ref.invalidate(firebaseAppProvider);
    ref.invalidate(supabaseAppProvider);
  });
  // await Future.any([
  //   Future.delayed(const Duration(seconds: 3)),
  // ]);
}
