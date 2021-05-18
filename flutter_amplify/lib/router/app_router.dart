import 'package:flutter/material.dart';
import 'package:flutter_amplify/presentation/screens/home_screen.dart';
import 'package:flutter_amplify/presentation/screens/user_feed.dart';
import 'package:flutter_amplify/constants/constants.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homeRoute:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(
                  title: 'Login Screen',
                ));
        break;
      case feedRoute:
        return MaterialPageRoute(
            builder: (_) => UserFeed(title: 'Feed Screen'));
        break;
      default:
        return null;
    }
  }
}
