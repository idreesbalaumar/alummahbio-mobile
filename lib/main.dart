import 'package:alummahbio/router/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:alummahbio/router/router.dart';
// import 'package:flutter/src/widgets/router.dart';

void main() {
  runApp(Alummahbio());
}

class Alummahbio extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'alummahbio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
     primarySwatch: Colors.blue,
     visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //  home: BeneficiariesPage(),
      onGenerateRoute: ARouter.onGenerateRoute,
      initialRoute: homeRoute,
    );
  }
}

