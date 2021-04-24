import 'package:alummahbio/values/images.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            Container(
              height: 250,
              child: Center(
                child: Image.asset(Images.logo),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "Enter your email/username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
            buildSizedBox(15),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Enter your password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
            buildSizedBox(15),
            MaterialButton(
              onPressed: () {},
              height: 55,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            buildSizedBox(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account ?"),
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () {},
                  child: Text("Sign Up", style: TextStyle(color: Theme.of(context).primaryColor),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double height ) {
    return SizedBox(
            height: height,
          );
  }
}
