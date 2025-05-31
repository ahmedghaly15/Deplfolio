import 'package:flutter/material.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../features/layout/presentation/view/layout_view.dart';
import '../../features/login/presentation/view/login_view.dart';
import '../utils/app_strings.dart';
import 'routes.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _layoutRoute();
      // return isUserLoggedIn ? _layoutRoute() : _loginRoute();
      case Routes.login:
        return _loginRoute();
      case Routes.layout:
        return _layoutRoute();
      default:
        return _unFoundRoute();
    }
  }

  static MaterialPageRoute<dynamic> _layoutRoute() {
    return MaterialPageRoute(builder: (_) => const LayoutView());
  }

  static MaterialPageRoute<dynamic> _loginRoute() =>
      MaterialPageRoute(builder: (_) => const LoginView());

  static Route<dynamic> _unFoundRoute() {
    return MaterialPageRoute(
      builder:
          (context) => Scaffold(
            body: Center(
              child: Text(
                AppStrings.unFoundRoute,
                style: context.shadTextTheme.h3,
              ),
            ),
          ),
    );
  }
}
