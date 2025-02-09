import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthRepository {
  final GoTrueClient supabaseAuth;

  User? get getUser => supabaseAuth.currentUser;

  SupabaseAuthRepository(this.supabaseAuth);

  Future<AuthResponse> signIn(String email, String password) async {
    final response = await supabaseAuth.signInWithPassword(
      email: email,
      password: password,
    );
    return response;
  }

  Future<AuthResponse> signUp(
      String email, String password, Map<String, dynamic>? userData) async {
    final response = supabaseAuth.signUp(
      email: email,
      password: password,
      data: userData,
    );
    return response;
  }

  String? get getAccessToken => supabaseAuth.currentSession?.accessToken;
}

final supabaseAuthProvider =
    AutoDisposeProvider<GoTrueClient>((ref) => Supabase.instance.client.auth);

final supabaseAuthRepositoryProvider =
    AutoDisposeProvider<SupabaseAuthRepository>(
  (ref) => SupabaseAuthRepository(ref.read(supabaseAuthProvider)),
);
