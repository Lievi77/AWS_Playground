import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
//import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import '../widgets/sign_in_widget.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import '../../amplifyconfiguration.dart';
import 'package:flutter_amplify/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.title});

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    // Add Pinpoint and Cognito Plugins, or any other plugins you want to use
    //AmplifyAnalyticsPinpoint analyticsPlugin = AmplifyAnalyticsPinpoint();
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    //Check Amplify Docs to see more plugins
    Amplify.addPlugin(authPlugin);

// Once Plugins are added, configure Amplify
    // Note: Amplify can only be configured once.
    try {
      await Amplify.configure(amplifyconfig); //external configuration file
    } on AmplifyAlreadyConfiguredException {
      print(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SignInWidget(nextPage: feedRoute),
        ],
      ),
    );
  }
}
