import 'package:flutter/material.dart';
import 'package:flutter_appsync/business/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../login_screen.dart';
import '../feed_screen.dart';
import 'route_constants.dart';
import '../home_screen.dart';

class AppRouter {
//cubit declaration
//  final CounterCubit _counterCubit = CounterCubit();
  final AuthCubit _authCubit = AuthCubit();

  Route onGenerateRoute(RouteSettings routeSettings) {
    //access with settings.name
    switch (routeSettings.name) {
      case HomeRoute:
        return MaterialPageRoute(
            builder: (_) =>
                //use .value whenever you want to provide an already existent instance
                HomeScreen());

      case LogInRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _authCubit,
                  child: LoginScreen(),
                ));
        break;
      case FeedRoute:
        //only use Provider.value whenever you do not want to re-create a Bloc
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _authCubit,
                  child: FeedScreen(),
                ));
        break;
      // case "/third":
      //   return MaterialPageRoute(
      //       builder: (_) => BlocProvider.value(
      //           value: _counterCubit,
      //           child: ThirdScreen(
      //             title: "Third Screen",
      //           )));
      //   break;
      default:
        return null;
    }
  }

//When using BlocProvider.value,
// the cubit doesn't auto close
  void dispose() {
    _authCubit.close();
  }
}
