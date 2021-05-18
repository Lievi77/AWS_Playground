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
      body: Column(
        children: [Text("Some Feed")],
      ),
    );
  }
}
