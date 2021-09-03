import 'package:flutter/material.dart';

class FeedLandingScreen extends StatefulWidget {
  const FeedLandingScreen({Key? key}) : super(key: key);

  @override
  _FeedLandingScreenState createState() => _FeedLandingScreenState();
}

class _FeedLandingScreenState extends State<FeedLandingScreen> {
  List posts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feed"),
      ),
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, i) {
            return Container();
          }),
    );
  }
}
