import 'package:fake_yape_app/auth/repositories/supabase_auth_repository.dart';
import 'package:fake_yape_app/yape/repositories/supabase_database_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@Riverpod()
class HomeController extends _$HomeController {
  @override
  FutureOr<double?> build() {
    return null;
  }

  Future<void> getUserBalance() async {
    state = const AsyncLoading();
    final authRepository = ref.read(supabaseAuthRepositoryProvider);
    final user = authRepository.getUser;
    final supabaseRepository = ref.read(supabaseDatabaseRepositoryProvider);
    state = await AsyncValue.guard(
        () => supabaseRepository.getUserBalanceByAuthId(user!.id));
  }
}
