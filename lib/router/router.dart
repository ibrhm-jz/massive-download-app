import 'package:auto_route/auto_route.dart';
import 'package:flutter_exam/router/guards/session_guard.dart';
import 'package:flutter_exam/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: WelcomeRoute.page,
            path: '/Welcome',
            initial: true,
            guards: [SessionGuard()]),
        AutoRoute(
          page: HomeBookRoute.page,
          path: '/Download',
        ),
        AutoRoute(
          page: DetailsRoute.page,
          path: '/Details',
        ),
      ];
}
