import 'package:covid_app/core/routes/routes.dart';
import 'package:covid_app/presentation/pages/home_page.dart';
import 'package:covid_app/presentation/pages/splash_page.dart';
import 'package:covid_app/presentation/pages/state_detail_page.dart';
import 'package:covid_app/presentation/pages/states_page.dart';
import 'package:flutter/material.dart';

import '../../presentation/pages/login_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );

      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );

      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case Routes.statesRoute:
        return MaterialPageRoute(
          builder: (context) => const StatesPage(),
        );
      case Routes.statesDetailRoute:
        var value = args as String;
        return MaterialPageRoute(
          builder: (context) => StateDetailPage(
            state: value,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
    }
  }
}
