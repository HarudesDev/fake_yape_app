import 'package:fake_yape_app/auth/repositories/supabase_auth_repository.dart';
import 'package:fake_yape_app/yape/repositories/supabase_database_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userLastYapeosProvider = FutureProvider((ref) async {
  final supabaseClient = ref.read(supabaseClientProvider);
  final supabaseRepository = ref.read(supabaseDatabaseRepositoryProvider);
  final auth = ref.read(supabaseAuthRepositoryProvider);
  final user = await supabaseClient
      .from('users')
      .select('id')
      .filter('auth_service_id', 'eq', auth.getUser!.id);
  final userId = user[0]['id'];
  return supabaseRepository.getLastYapeos(userId);
});
