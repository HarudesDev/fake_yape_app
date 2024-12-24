import 'package:fake_yape_app/auth/repositories/supabase_auth_repository.dart';
import 'package:fake_yape_app/yape/models/user.dart';
import 'package:fake_yape_app/yape/models/yapeo.dart';
import 'package:fake_yape_app/yape/repositories/supabase_database_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'yapeos_provider.g.dart';

final userLastYapeosProvider =
    AutoDisposeFutureProvider<List<Yapeo>>((ref) async {
  final supabaseRepository = ref.read(supabaseDatabaseRepositoryProvider);
  final auth = ref.read(supabaseAuthRepositoryProvider);
  final user = await supabaseRepository.getUserByAuthId(auth.getUser!.id);
  final userId = user!.id;
  return supabaseRepository.getLastYapeos(userId);
});

@riverpod
Future<List<Map<String, dynamic>>> userLastYapeosFromDate(
    Ref ref, DateTime startDate) async {
  final supabaseRepository = ref.read(supabaseDatabaseRepositoryProvider);
  final auth = ref.read(supabaseAuthRepositoryProvider);
  final user = await supabaseRepository.getUserByAuthId(auth.getUser!.id);
  final userId = user!.id;
  return supabaseRepository.getLastYapeosFromDate(userId, startDate);
}

@riverpod
Future<MyUser?> userByPhone(Ref ref, String phoneNumber) {
  final supabaseRepository = ref.read(supabaseDatabaseRepositoryProvider);
  return supabaseRepository.getUserByPhone(phoneNumber);
}

@riverpod
Future<MyUser?> userByAuthId(Ref ref, String authId) {
  final supabaseRepository = ref.read(supabaseDatabaseRepositoryProvider);
  return supabaseRepository.getUserByAuthId(authId);
}
