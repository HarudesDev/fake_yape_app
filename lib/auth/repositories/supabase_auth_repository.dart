import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthRepository {
  final GoTrueClient supabaseAuth;

  User? get getUser => supabaseAuth.currentUser;

  SupabaseAuthRepository(this.supabaseAuth);
}

final supabaseAuthProvider =
    AutoDisposeProvider<GoTrueClient>((ref) => Supabase.instance.client.auth);

final supabaseAuthRepositoryProvider =
    AutoDisposeProvider<SupabaseAuthRepository>(
  (ref) => SupabaseAuthRepository(ref.read(supabaseAuthProvider)),
);
