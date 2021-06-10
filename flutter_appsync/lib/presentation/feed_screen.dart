import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter_appsync/models/Post.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  bool _isLoading = false; //change to true when fetching logic is finished
  var posts = [];
  void _fetchPosts() {}

  @override
  Widget build(BuildContext context) {
    print("~~Building Feed Screen");
    if (_isLoading) {
      return Container(
        child: LinearProgressIndicator(),
      );
    } else {
      return RefreshIndicator(
        onRefresh: () {
          _fetchPosts();

          return null;
        },
        child: Scaffold(
          appBar: AppBar(title: Text("My Feed")),
          body: Container(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: kPostContainerDecoration,
                  margin: EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 5.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(posts[index].data()["name"]),

                      SizedBox(
                        height: 5.0,
                      ),

                      //We will use FadeIn Image to display a placeholder while loading

                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: FadeInImage(
                            placeholder: AssetImage("assets/placeholder.jpg"),
                            image:
                                NetworkImage(posts[index].data()["photoUrl"])),
                      ),

                      SizedBox(
                        height: 5.0,
                      ),

                      RichText(
                        softWrap: true,
                        text: TextSpan(style: kTextSpanStyle, children: [
                          TextSpan(
                              text: posts[index].data()["name"],
                              style: kUserCaptionDisplayStyle),
                          TextSpan(
                            text: "   " + posts[index].data()["caption"],
                            style: kCaptionDisplayStyle,
                          ),
                        ]),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );
    }
  }
}
