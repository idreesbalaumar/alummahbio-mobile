import 'package:alummahbio/presentation/Beneficiaries/beneficiaries_page.dart';
import 'package:alummahbio/presentation/auth/account_page.dart';
import 'package:alummahbio/presentation/organisations/organizations_page.dart';
import 'package:alummahbio/values/branding_color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  List<Widget> _screens = [
    BeneficiariesPage(),
    OrganizationsPage(),
    AccountPage()
  ];

  int _selectedIndex = 0;

  void _onPageChanged(int pageIndex){
    setState(() {
      _selectedIndex = pageIndex;
    });
  }

  void _onItemTapped(int itemIndex){
    _pageController.jumpToPage(itemIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Home Page"),
      // ),
      body: PageView(
        children: _screens,
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Text(
              "Beneficiaries",
              style: TextStyle(
                color: _selectedIndex == 0 ? brandinPrimaryColor : Colors.grey,
                ),
          ),
          icon: Icon(Icons.home, color: _selectedIndex == 0 ? brandinPrimaryColor : Colors.grey,),
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Text(
              "Organization",
              style: TextStyle(
                color: _selectedIndex == 1 ? brandinPrimaryColor : Colors.grey,
                ),
          ),
          icon: Icon(Icons.group_outlined, color: _selectedIndex == 1 ? brandinPrimaryColor : Colors.grey,),
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Text(
              "Account",
             style: TextStyle(
                color: _selectedIndex == 2 ? brandinPrimaryColor : Colors.grey,
                ),
          ),
          icon: Icon(Icons.person, color: _selectedIndex == 2 ? brandinPrimaryColor : Colors.grey,)),
        ],
      ),
    );
  }
}