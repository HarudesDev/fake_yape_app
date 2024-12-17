import 'package:fake_yape_app/auth/pages/welcome_page/welcome_page.dart';
import 'package:fake_yape_app/auth/repositories/supabase_auth_repository.dart';
import 'package:fake_yape_app/home/pages/home_page/home_page.dart';
import 'package:fake_yape_app/shared/providers/auth_provider.dart';
import 'package:fake_yape_app/shared/providers/yapeos_provider.dart';
import 'package:fake_yape_app/yape/repositories/supabase_database_repository.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class Wrapper extends ConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangeProvider);

    return authState.when(
        data: (user) {
          ref.invalidate(supabaseAuthProvider);
          ref.invalidate(supabaseAuthRepositoryProvider);
          ref.invalidate(supabaseClientProvider);
          ref.invalidate(supabaseDatabaseRepositoryProvider);
          ref.invalidate(userLastYapeosProvider);
          return user.session == null ? const WelcomePage() : const HomePage();
        },
        error: (error, _) => Text('Error:$error'),
        loading: () => const CircularProgressIndicator());
  }
}
