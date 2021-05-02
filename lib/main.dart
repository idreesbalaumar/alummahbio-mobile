import 'package:alummahbio/application/storage/localstorage.dart';
import 'package:alummahbio/application/storage/storage_keys.dart';
import 'package:alummahbio/router/route_constants.dart';
import 'package:alummahbio/values/branding_color.dart';
import 'package:flutter/material.dart';
import 'package:alummahbio/router/router.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'app_theme.dart';
import 'application/repositories/auth_repository.dart';
import 'application/state/auth_state.dart';
// import 'package:flutter/src/widgets/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initializeSharedPreferences();
  runApp(Alummahbio());
}

class Alummahbio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
        inject: [Inject<AuthState>(() => AuthState(AuthRepositoryImpl()))],
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
            //  home: BeneficiariesPage(),
            onGenerateRoute: ARouter.onGenerateRoute,
            initialRoute:
                LocalStorage.getItem(TOKEN) != null ? homeRoute : signInRoute,
          );
        });
  }
}
