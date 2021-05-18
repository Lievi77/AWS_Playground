import 'package:flutter/material.dart';
import 'package:flutter_amplify/presentation/screens/home_screen.dart';
import 'package:flutter_amplify/presentation/screens/user_feed.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => HomeScreen(
                  title: 'Login Screen',
                ));
        break;
      case '/feed':
        return MaterialPageRoute(
            builder: (_) => UserFeed(title: 'Feed Screen'));
        break;
      default:
        return null;
    }
  }

  //Used to close a cubit
  void dispose() {}
}
