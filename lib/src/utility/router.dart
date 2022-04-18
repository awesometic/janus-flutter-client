import 'package:flutter/material.dart';

import '../screens/home/home.dart';
import '../screens/login/login.dart';
import '../screens/register/register.dart';
import 'constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.home:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case RouteConstant.login:
        return MaterialPageRoute(builder: (context) => const LogInView());
      case RouteConstant.register:
        return MaterialPageRoute(builder: (context) => const RegisterView());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                body: Center(child: Text(StringConstant.pageNotFound))));
    }
  }
}
