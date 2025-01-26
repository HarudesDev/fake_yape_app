import 'package:auto_route/auto_route.dart';
import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: LoggedAccessRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SecureKeyboardRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: RegisterDataRoute.page),
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: MenuRoute.page,
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: MenuMyQrRoute.page,
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: MakeYapeRoute.page,
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: QrReaderRoute.page,
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: YapeDetailRoute.page,
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: YapeDirectoryRoute.page,
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: TransactionsRoute.page,
          guards: [AuthGuard()],
        ),
      ];
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    const storage = FlutterSecureStorage();
    final hasLogged = await storage.read(key: "email");
    print("has Logged: $hasLogged");
    final auth = Supabase.instance.client.auth;
    final user = auth.currentUser;
    if (user != null) {
      resolver.next(true);
    } else {
      if (hasLogged == null) {
        resolver.redirect(const WelcomeRoute());
      } else {
        resolver.redirect(const LoggedAccessRoute());
      }
    }
  }
}
