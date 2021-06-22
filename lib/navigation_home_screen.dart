import 'package:alummahbio/custom_drawer/drawer_user_controller.dart';
import 'package:alummahbio/custom_drawer/home_drawer.dart';
import 'package:alummahbio/presentation/Beneficiaries/beneficiaries_page.dart';
import 'package:alummahbio/presentation/Beneficiaries/capture_beneficiary.dart';
import 'package:alummahbio/presentation/auth/account_page.dart';
import 'package:alummahbio/presentation/organisations/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.Dashboard;
    screenView = DashboardPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white10,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.Dashboard) {
        setState(() {
          screenView = DashboardPage();
        });
      } else if (drawerIndex == DrawerIndex.Beneficiaries) {
        setState(() {
          screenView = BeneficiariesPage();
        });
      } else if (drawerIndex == DrawerIndex.CaptureNewBeneficiary) {
        setState(() {
          screenView = CaptureBeneficiary();
        });
      } else if (drawerIndex == DrawerIndex.Profile) {
        setState(() {
          screenView = AccountPage();
        });
      } else {
        //do in your way......
      }
    }
  }
}
