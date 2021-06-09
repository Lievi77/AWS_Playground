import 'package:flutter/material.dart';

class UserCredentials {
  UserCredentials(
      {@required this.username,
      @required this.password,
      @required this.isAuth});

  String username;
  String password;
  bool isAuth;

  set authorization(bool isAuth) {
    this.isAuth = isAuth;
  }
}
