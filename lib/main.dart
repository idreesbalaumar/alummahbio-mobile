import 'package:alummahbio/application/repositories/beneficiary_repository.dart';
import 'package:alummahbio/application/state/beneficiary_state.dart';
import 'package:alummahbio/application/storage/localstorage.dart';
import 'package:alummahbio/application/storage/storage_keys.dart';
import 'package:alummahbio/presentation/auth/sign_in_page.dart';
import 'package:alummahbio/presentation/auth/sign_up_page.dart';
import 'package:alummahbio/presentation/pages/intro_screen.dart';
import 'package:alummahbio/presentation/pages/splash_screen.dart';
import 'package:alummahbio/router/route_constants.dart';
import 'package:alummahbio/router/router.dart';
import 'package:alummahbio/values/branding_color.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'app_theme.dart';
import 'application/repositories/auth_repository.dart';
import 'application/state/auth_state.dart';

// import 'package:flutter/src/widgets/router.dart';
//
var routes = <String, WidgetBuilder>{
  "/splash-screen": (BuildContext context) => SplashScreen(),
  "/sign-up": (BuildContext context) => SignUpPage(),
  "/intro": (BuildContext context) => IntroScreen(),
  "/sign-in": (BuildContext context) => SignInPage(),
};

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initializeSharedPreferences();
  runApp(Alummahbio());
}

class Alummahbio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
        inject: [
          Inject<AuthState>(() => AuthState(AuthRepositoryImpl())),
          Inject<BeneficiaryState>(
              () => BeneficiaryState(BeneficiaryRepositoryImpl())),
        ],
        builder: (context) {
          return MaterialApp(
            title: 'Alummahbio',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: AppTheme.notWhite.withOpacity(1),
              textTheme: AppTheme.textTheme,
              fontFamily: AppTheme.fontName,
              primarySwatch: brandingColor,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: SplashScreen(),
            routes: routes,
            //  home: BeneficiariesPage(),
            onGenerateRoute: ARouter.onGenerateRoute,
            initialRoute:
                LocalStorage.getItem(TOKEN) != null ? homeRoute : signInRoute,
          );
        });
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}