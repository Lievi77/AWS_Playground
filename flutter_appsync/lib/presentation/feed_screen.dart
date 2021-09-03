import 'package:flutter/material.dart';
import 'package:flutter_appsync/models/ModelProvider.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<Post> posts;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mock Feed"),
      ),
      body: ListView.builder(
          itemCount: posts.length, itemBuilder: (context, index) {}),
    );
  }
}
