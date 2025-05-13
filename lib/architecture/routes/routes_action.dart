import 'package:flutter/material.dart';
import 'package:carrental/architecture/routes/route_helper.dart';
import 'package:carrental/architecture/routes/routes.dart';
import 'package:carrental/screen/home.dart';
import 'package:carrental/screen/login.dart';
import 'package:carrental/screen/main_screen.dart';
import 'package:carrental/screen/registration/registration_screen.dart';

class RoutesAction {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    RouteHelper value = settings.arguments as RouteHelper;
    switch (settings.name) {
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (_) => MainScreen());

    case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => Home());

      case Routes.LOGIN:
        return MaterialPageRoute(builder: (_) => LoginPage());

      case Routes.searchScreen:
        return MaterialPageRoute(
            builder: (_) => RegistrationScreen(
                  title: value.title!,
                  car: value.car,
                ));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
