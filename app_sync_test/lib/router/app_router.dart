import 'package:app_sync_test/presentation/landing_screen.dart';
import 'package:app_sync_test/presentation/new_user_screen.dart';
import 'package:app_sync_test/router/routing_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LandingRoute:
        return MaterialPageRoute(builder: (_) => LandingScreen());

      case NewUserRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      default:
        return MaterialPageRoute(builder: (_) => LandingScreen());
    }
  }
}
