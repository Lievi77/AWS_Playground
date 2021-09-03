import 'package:app_sync_test/router/app_router.dart';
import 'package:app_sync_test/router/routing_constants.dart';
import 'package:flutter/material.dart';
import 'amplifyconfiguration.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  void initState() {
    // TODO: implement initState

    _configureAmplify();

    super.initState();
  }

  void _configureAmplify() async {
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();

    await Amplify.addPlugin(authPlugin);

    try {
      Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print("Tried to configure Amplify twice");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _appRouter.onGenerateRoute,
      initialRoute: LandingRoute,
    );
  }
}
