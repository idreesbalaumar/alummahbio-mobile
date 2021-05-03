import 'package:flutter/material.dart';

class MyNavigator {
  static void goToSignUp(BuildContext context) {
    Navigator.pushNamed(context, "/sign-up");
  }

  static void goToIntro(BuildContext context) {
    Navigator.pushNamed(context, "/intro");
  }

  static void goToSinIn(BuildContext context) {
    Navigator.pushNamed(context, "/sign-in");
  }
}
