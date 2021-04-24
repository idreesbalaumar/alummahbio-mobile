import 'package:alummahbio/presentation/Beneficiaries/beneficiaries_page.dart';
import 'package:alummahbio/presentation/auth/sign_in_page.dart';
import 'package:alummahbio/presentation/auth/sign_up_page.dart';
import 'package:alummahbio/presentation/home/home_page.dart';
import 'package:alummahbio/presentation/not_found/not_found_page.dart';
import 'package:alummahbio/router/route_constants.dart';
import 'package:flutter/material.dart';

class ARouter {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case beneficiariesRoute:
        return MaterialPageRoute(builder: (_) => BeneficiariesPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case signInRoute:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());

    }
  }
}