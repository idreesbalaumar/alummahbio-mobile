import 'package:flutter/material.dart';

class MyNavigator {
  static void goToSplashScreen(BuildContext context) {
    Navigator.pushNamed(context, "/splash-screen");
  }

  static void goToSignUp(BuildContext context) {
    Navigator.pushNamed(context, "/sign-up");
  }

  static void goToIntro(BuildContext context) {
    Navigator.pushNamed(context, "/intro");
  }

  static void goToSinIn(BuildContext context) {
    Navigator.pushNamed(context, "/sign-in");
  }
  static void goToDashboard(BuildContext context) {
    Navigator.pushNamed(context, "/dashboard");
  }
  static void goToBeneficiaries(BuildContext context) {
    Navigator.pushNamed(context, "/beneficiaries");
  }
  static void goToNewBeneficiaries(BuildContext context) {
    Navigator.pushNamed(context, "/new-beneficiaries");
  }
  static void goToProfile(BuildContext context) {
    Navigator.pushNamed(context, "/profife");
  }
}
