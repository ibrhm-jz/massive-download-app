import 'package:auto_route/auto_route.dart';
import 'package:flutter_exam/router/router.gr.dart';


@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: WelcomeRoute.page,
          path: '/Welcome',
          initial: true,
        ),
      
      ];
}
