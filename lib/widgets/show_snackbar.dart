import 'package:alummahbio/values/branding_color.dart';
import 'package:flutter/material.dart';

showSnackbar(
    {@required GlobalKey<ScaffoldState> key,
    @required String message,
    Color color}) {
  key.currentState.showSnackBar(
    SnackBar(
      backgroundColor: color ?? brandingColor,
      content: Text(message),
    ),
  );
}
