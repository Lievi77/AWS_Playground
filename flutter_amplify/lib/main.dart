import 'package:flutter/material.dart';
import 'package:flutter_amplify/business_logic/auth_bloc.dart';
import 'package:flutter_amplify/router/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './presentation/screens/sign_in_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_amplify/constants/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // Wrapping the material app with blocProvider will grant EVERY screen access to a bloc;
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(), //AuthBloc is now globally available
      child: MaterialApp(
        title: 'AWS Amplify Playground',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        onGenerateRoute: _appRouter.onGenerateRoute,
        initialRoute: signUpRoute,
        //home: HomeScreen(title: 'Flutter Amplify Login'),
      ),
    );
  }
}
