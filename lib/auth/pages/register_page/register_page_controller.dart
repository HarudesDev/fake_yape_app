import 'package:fake_yape_app/yape/repositories/supabase_database_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_page_controller.g.dart';

@Riverpod()
class RegisterPageController extends _$RegisterPageController {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<bool> isValidPhoneNumber(String phoneNumber) async {
    state = const AsyncLoading();
    final supabaseDatabaseRepository =
        ref.read(supabaseDatabaseRepositoryProvider);
    bool isValid = false;
    state = await AsyncValue.guard(
      () async {
        isValid = await supabaseDatabaseRepository
            .isPhoneNumberUnregistered(phoneNumber);
      },
    );
    return isValid;
  }
}
