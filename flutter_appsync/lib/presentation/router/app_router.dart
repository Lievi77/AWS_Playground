import 'package:flutter/material.dart';

import 'package:flutter_appsync/business/connection_cubit/connection_cubit.dart';
import 'package:flutter_appsync/business/log_in_cubit/log_in_cubit.dart';
import 'package:flutter_appsync/business/reset_password_cubit/reset_password_cubit.dart';
import 'package:flutter_appsync/business/sign_up_cubit/sign_up_cubit.dart';

import 'package:flutter_appsync/presentation/auth_screens/confirmation_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth_screens/login_screen.dart';
import '../auth_screens/signup_screen.dart';
import '../../constants/route_constants.dart';
import '../home_screen.dart';
import '../auth_screens/recover_password_screen.dart';
import '../auth_screens/confirmation_password_screen.dart';

class AppRouter {
//cubit declaration
//  final CounterCubit _counterCubit = CounterCubit();

//Architecture tip:
// start with least dependent class -> end with most dependent class
  final ConnectionCubit _connectionCubit = ConnectionCubit();
  final LoginCubit _loginCubit = LoginCubit();
  final ResetPasswordCubit _resetPasswordCubit = ResetPasswordCubit();
  //If a screen uses the same states/cubit instance -> declare it in AppRouter
  final SignUpCubit _signUpCubit = SignUpCubit();

  Route onGenerateRoute(RouteSettings routeSettings) {
    //access with settings.name
    switch (routeSettings.name) {
      case HomeRoute:
        return MaterialPageRoute(
            builder: (_) =>
                //use .value whenever you want to provide an already existent instance
                HomeScreen());

      case SignInRoute:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: _loginCubit,
                    ),
                    BlocProvider.value(value: _connectionCubit)
                  ],
                  child: LoginScreen(),
                ));
        break;
      case FeedRoute:
        //only use Provider.value whenever you do not want to re-create a Bloc
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: _loginCubit,
                    ),
                    BlocProvider.value(value: _connectionCubit)
                  ],
                  child: LoginScreen(),
                ));
        break;
      case ConfirmRoute:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: _loginCubit,
                    ),
                    BlocProvider.value(value: _connectionCubit),
                    BlocProvider.value(value: _signUpCubit)
                  ],
                  child: ConfirmationScreen(),
                ));
        break;
      case SignUpRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _signUpCubit,
                  child: SignUpScreen(),
                ));
      // case "/third":
      //   return MaterialPageRoute(
      //       builder: (_) => BlocProvider.value(
      //           value: _counterCubit,
      //           child: ThirdScreen(
      //             title: "Third Screen",
      //           )));
      //   break;
      case RecoverPasswordRoute:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider.value(value: _resetPasswordCubit),
                  BlocProvider.value(value: _connectionCubit)
                ], child: RecoverPasswordScreen()));
      case ConfirmPasswordRoute:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider.value(value: _resetPasswordCubit),
                  BlocProvider.value(value: _connectionCubit)
                ], child: ConfirmCodeScreen()));
        break;

      default:
        return null;
    }
  }

//When using BlocProvider.value,
// the cubit doesn't auto close
  void dispose() {
    _loginCubit.close();
    _connectionCubit.close();
    _resetPasswordCubit.close();
    _signUpCubit.close();
  }
}
