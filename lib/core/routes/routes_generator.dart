import 'package:covid_app/presentation/pages/home_page.dart';
import 'package:covid_app/presentation/pages/state_detail_page.dart';
import 'package:covid_app/presentation/pages/states_page.dart';
import 'package:flutter/material.dart';

import '../../presentation/pages/login_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );

      case '/login':
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );

      case '/home':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case '/states':
        return MaterialPageRoute(
          builder: (context) => const StatesPage(),
        );
      case '/states/detail':
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
