import 'package:flutter/material.dart';

const kLoginScreenTitleStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
  color: Colors.pink,
);

const kProfileNameDisplayStyle = TextStyle(fontSize: 30.0);

const kPrimaryScreenColor = Color(0xFFD35400);
const kBlackColor = Color(0x22000000);

const kProfilePicRadius = 40.0;

const kProfilePicHeight = 170.0;

const kProfilePicWidth = 170.0;

const kInputDecoration = InputDecoration(
  hintText: "Write a Caption here",
);

const kAppBarIconTheme = IconThemeData(
  color: Colors.black,
);

const kAppBarTextStyle = TextStyle(
  color: Colors.black,
);

final kPostContainerDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(8.0),
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      blurRadius: 6,
      color: kBlackColor,
      offset: Offset(0, 4),
    ),
  ],
);

const kUserCaptionDisplayStyle = TextStyle(
  fontWeight: FontWeight.bold,
);

const kCaptionDisplayStyle = TextStyle(fontSize: 12.0);

const kTextSpanStyle = TextStyle(color: Colors.black);
