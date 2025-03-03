import 'package:auto_route/auto_route.dart';
import 'package:flutter_exam/core/storage/session_storage.dart';
import 'package:flutter_exam/router/router.gr.dart';
class SessionGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final bool downloadComplete = await SessionStorage.getDownloadComplete();
    if (downloadComplete) {
      router.push(const HomeBookRoute());
      return;
    }
    resolver.next(true);
  }

}
