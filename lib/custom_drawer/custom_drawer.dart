import 'package:alummahbio/utils/my_navigator.dart';
import 'package:alummahbio/values/images.dart';
import 'package:flutter/material.dart';

 class Custom_drawer extends StatefulWidget {
  Custom_drawer({Key key}) : super(key: key);

  @override
  _Custom_drawerState createState() => _Custom_drawerState();
}

class _Custom_drawerState extends State<Custom_drawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      
    );
  }
}
class CustomListTitle extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;
  CustomListTitle(this.icon, this.text, this.onTap);
  @override
  // Widget @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        // decoration: BoxDecoration(
        //     border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
            splashColor: Theme.of(context).primaryColor,
            onTap: onTap,
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: -0.1,
                          // color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ]),
                  Icon(Icons.arrow_right)
                ],
              ),
            )),
      ),
    );
  }
}