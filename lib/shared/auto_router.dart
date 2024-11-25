import 'package:auto_route/auto_route.dart';
import 'package:fake_yape_app/shared/auto_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: Wrapper.page,
          initial: true,
        ),
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: LoginPasswordRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: MakeYapeRoute.page),
        AutoRoute(page: QrReaderRoute.page),
        AutoRoute(page: YapeDetailRoute.page),
        AutoRoute(page: YapeDirectoryRoute.page),
        AutoRoute(page: TransactionsRoute.page),
      ];

  @override // optionally add root guards here
  List<AutoRouteGuard> get guards => [];
}
