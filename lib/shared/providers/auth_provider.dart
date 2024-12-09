import 'package:fake_yape_app/auth/repositories/supabase_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authStateChangeProvider = StreamProvider<AuthState>((ref) {
  return ref.read(supabaseAuthProvider).onAuthStateChange;
});
