import 'package:alummahbio/values/branding_color.dart';
import 'package:flutter/material.dart';

showSnackbar(
    {@required GlobalKey<ScaffoldState> key,
    @required String message,
    Color color,
    BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      key: key,
      backgroundColor: color ?? brandingColor,
      content: Text(message),
    ),
  );
}
