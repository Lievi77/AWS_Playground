import 'package:flutter/material.dart';

class UserFeed extends StatefulWidget {
  UserFeed({@required this.title});

  final String title;

  @override
  _UserFeedState createState() => _UserFeedState();
}

class _UserFeedState extends State<UserFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Some Feed"),
            MaterialButton(
                color: Colors.green,
                child: Text("Return to previous screen"),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
