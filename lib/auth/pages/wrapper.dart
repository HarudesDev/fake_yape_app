import 'package:fake_yape_app/auth/pages/welcome_page/welcome.dart';
import 'package:fake_yape_app/home/pages/home.dart';
import 'package:fake_yape_app/shared/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class Wrapper extends ConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return authState.when(
        data: (user) {
          print(AutoRouter.of(context).stack.toString());
          return user.session == null ? const WelcomePage() : const HomePage();
        },
        error: (error, _) => Text('Error:$error'),
        loading: () => const CircularProgressIndicator());
  }
}
