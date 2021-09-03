import 'package:app_sync_test/presentation/auth/confirm_code.dart';
import 'package:app_sync_test/presentation/auth/landing_screen.dart';
import 'package:app_sync_test/presentation/auth/new_user_screen.dart';
import 'package:app_sync_test/presentation/feed/feed_landing_screen.dart';
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

      case ConfirmCodeRoute:
        return MaterialPageRoute(builder: (_) => ConfirmCodeScreen());

      case FeedLandingRoute:
        return MaterialPageRoute(builder: (_) => FeedLandingScreen());

      default:
        return MaterialPageRoute(builder: (_) => LandingScreen());
    }
  }
}
