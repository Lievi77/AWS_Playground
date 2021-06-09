import 'package:flutter/material.dart';
import 'package:flutter_appsync/presentation/login_screen.dart';
import 'package:amplify_flutter/amplify.dart';
import 'dart:async';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'amplifyconfiguration.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_appsync/business/auth_cubit.dart';
import 'presentation/feed_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AmplifyAPI _amplifyAPI = AmplifyAPI();
  final AmplifyAuthCognito _amplifyAuthCognito = AmplifyAuthCognito();

  Future<void> _amplifyConfig() async {
    try {
      // add Amplify plugins
      await Amplify.addPlugins([_amplifyAPI, _amplifyAuthCognito]);

      // configure Amplify
      //
      // note that Amplify cannot be configured more than once!
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      // error handling can be improved for sure!
      // but this will be sufficient for the purposes of this tutorial
      print('An error occurred while configuring Amplify: $e');
    }
    print("~~~~ Amplify Init Successful");
  }

  void _initApp() async {
    await _amplifyConfig();
  }

  Widget buildLoginScreen() {
    return LoginScreen(title: 'Flutter Demo Home Page');
  }

  Widget buildFeedScreen() {
    return FeedScreen();
  }

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("My App"),
          ),
          body: BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(),
            child: buildFeedScreen(),
          )),
    );
  }
}
