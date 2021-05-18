import 'package:flutter/material.dart';
import 'package:flutter_amplify/presentation/widgets/usr_passwd_widget.dart';
import 'package:flutter_amplify/constants/constants.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import '../../amplifyconfiguration.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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

  String usr;
  String passwd;

  final usrController = TextEditingController();
  final passwdController = TextEditingController();

  void clearControllers() {
    usrController.clear();
    passwdController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    usrController.dispose();
    passwdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          UserPasswdWidget(
            nextPage: signInRoute,
            buttonText: "Sign Up",
            passwdFldController: passwdController,
            userFldController: usrController,
            onPressed: () {
              usr = usrController.text;
              passwd = passwdController.text;

              clearControllers();
              // print(
              //     "~~Debug in Sign_Up_Widget: usr -> ${usr} , passwd -> ${passwd} ");
              Navigator.pushNamed(
                context,
                feedRoute,
              );
            },
          ),
        ],
      ),
    );
  }
}
