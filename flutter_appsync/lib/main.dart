import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/material.dart';

import 'package:flutter_appsync/presentation/auth_screens/login_screen.dart';
import 'package:amplify_flutter/amplify.dart';
import 'dart:async';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter_appsync/constants/route_constants.dart';

import 'amplifyconfiguration.dart';

import 'presentation/feed_screen.dart';
import 'models/ModelProvider.dart';
import 'presentation/router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  // AWS STUFF BEGINS
  final AmplifyAPI _amplifyAPI = AmplifyAPI();
  final AmplifyAuthCognito _amplifyAuthCognito = AmplifyAuthCognito();
  final AmplifyDataStore _amplifyDataStore =
      AmplifyDataStore(modelProvider: ModelProvider.instance);
  final AmplifyStorageS3 _amplifyStorageS3 = AmplifyStorageS3();
  //AWS STUFF ENDS

  Future<void> _amplifyConfig() async {
    try {
      // add Amplify plugins
      await Amplify.addPlugins([
        _amplifyAPI,
        _amplifyAuthCognito,
        _amplifyStorageS3,
        _amplifyDataStore
      ]);

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
      onGenerateRoute: _appRouter.onGenerateRoute,

      //need to specify initial Route
      initialRoute: HomeRoute,

      // home: Scaffold(
      //     appBar: AppBar(
      //       title: Text("My App"),
      //     ),
      //     body: BlocProvider<AuthCubit>(
      //       create: (context) => AuthCubit(),
      //       child: buildLoginScreen(),
      //     )),
    );
  }

  void dispose() {
    _appRouter.dispose(); //good resource management
    super.dispose();
  }
}
