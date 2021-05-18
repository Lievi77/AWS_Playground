import 'package:flutter/material.dart';
import 'package:flutter_amplify/presentation/screens/sign_in_screen.dart';
import 'package:flutter_amplify/presentation/screens/user_feed.dart';
import 'package:flutter_amplify/constants/constants.dart';
import 'package:flutter_amplify/presentation/screens/sign_up_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case signInRoute:
        return MaterialPageRoute(
            builder: (_) => SignInScreen(
                  title: 'Login Screen',
                ));
        break;
      case feedRoute:
        return MaterialPageRoute(
            builder: (_) => UserFeed(title: 'Feed Screen'));
        break;
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      default:
        return null;
    }
  }
}
