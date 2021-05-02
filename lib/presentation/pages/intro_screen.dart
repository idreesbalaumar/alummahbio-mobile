import 'package:alummahbio/utils/alummahbio.dart';
import 'package:alummahbio/utils/my_navigator.dart';
import 'package:alummahbio/widgets/walkthrough.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  IntroScreenState createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == 3) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEEEEEE),
      // color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: PageView(
              children: <Widget>[
                Walkthrough(
                  title: AlummahBio.wt1,
                  content: AlummahBio.wc1,
                  imageIcon: Icons.mobile_screen_share,
                ),
                Walkthrough(
                  title: AlummahBio.wt2,
                  content: AlummahBio.wc2,
                  imageIcon: Icons.search,
                ),
                Walkthrough(
                  title: AlummahBio.wt3,
                  content: AlummahBio.wc3,
                  imageIcon: Icons.shopping_cart,
                ),
                Walkthrough(
                  title: AlummahBio.wt4,
                  content: AlummahBio.wc4,
                  imageIcon: Icons.verified_user,
                ),
              ],
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Text(lastPage ? "" : AlummahBio.skip,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () =>
                      lastPage ? null : MyNavigator.goToLogin(context),
                ),
                TextButton(
                  child: Text(lastPage ? AlummahBio.gotIt : AlummahBio.next,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? MyNavigator.goToLogin(context)
                      : controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
