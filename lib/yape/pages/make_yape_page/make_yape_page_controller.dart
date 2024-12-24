import 'package:fake_yape_app/yape/models/yapeo.dart';
import 'package:fake_yape_app/yape/repositories/supabase_database_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'make_yape_page_controller.g.dart';

@Riverpod()
class MakeYapePageController extends _$MakeYapePageController {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<Yapeo?> doYapeo(
      int senderId, int receiverId, double yapeoAmount, String? message) async {
    state = const AsyncLoading();
    final supabaseDatabaseRepository =
        ref.read(supabaseDatabaseRepositoryProvider);
    Yapeo? yapeo;
    state = await AsyncValue.guard(
      () async {
        yapeo = await supabaseDatabaseRepository.doYapeo(
            senderId, receiverId, yapeoAmount, message);
      },
    );
    return yapeo;
  }
}
