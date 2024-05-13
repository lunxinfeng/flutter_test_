import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_/main.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

class Pages {
  static const home = '/';
  static const second = 'second';
}


final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: Pages.home,
  routes: $appRoutes,
);


@TypedGoRoute<HomeRoute>(path: Pages.home, name: Pages.home,routes: [
  TypedGoRoute<SecondRoute>(path: Pages.second,name: Pages.second),
])
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MyHomePage();
  }
}
class SecondRoute extends GoRouteData {
  const SecondRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SecondPage();
  }
}