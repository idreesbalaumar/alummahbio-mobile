import 'package:alummahbio/custom_drawer/custom_drawer.dart';
import 'package:alummahbio/utils/my_navigator.dart';
import 'package:alummahbio/values/images.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Account'),),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Container(
                    child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      elevation: 10,
                      child: Padding(padding: EdgeInsets.all(8.0),
                      child: Image.asset(Images.logo, width: 100, height: 100,),),
                    )
                  ],
                ))),
            CustomListTitle(Icons.home, 'Dashboard', () => {MyNavigator.goToDashboard(context)}),
            CustomListTitle(Icons.group, 'Beneficiaries', () => {MyNavigator.goToBeneficiaries(context)}),
            CustomListTitle(Icons.person, 'New Beneficiaries', () => {MyNavigator.goToNewBeneficiaries(context)}),
            CustomListTitle(Icons.person, 'Profile', () => {MyNavigator.goToProfile(context)}),
            CustomListTitle(Icons.power_settings_new, 'Logout', () => {MyNavigator.goToSinIn(context)}),
          ],
        ),
      ),

    );
  }
}