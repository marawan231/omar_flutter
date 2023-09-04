import 'package:flutter/material.dart';
import 'package:omar_flutter/screens/home_screen.dart';

import 'package:omar_flutter/screens/login_screen.dart';
import 'package:omar_flutter/screens/register_screen.dart';

class Routes {
  static const String login = "/login";
  static const String registerRoute = "/register";
  static const String homeRoute = "/homeRoute";
}

class RouteGenerator {
  Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );

      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(''),
              ),
              body: const Center(child: Text('')),
            ));
  }
}
