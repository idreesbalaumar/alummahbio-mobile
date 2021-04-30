import 'package:alummahbio/application/models/auth/sign_up_form_model.dart';
import 'package:alummahbio/router/route_constants.dart';
import 'package:alummahbio/values/branding_color.dart';
import 'package:alummahbio/values/images.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
      ),
      body: Injector(
        inject: [Inject<SignUpFormModel>(() => SignUpFormModel())],
        builder: (context) {
          // ignore: unused_local_variable
          final _singletonSignUpFormModel =
              Injector.getAsReactive<SignUpFormModel>();
          return Container(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: <Widget>[
                Container(
                  height: 250,
                  child: Center(
                    child: Image.asset(Images.logo),
                  ),
                ),
                StateBuilder<SignUpFormModel>(
                  observe: () => _singletonSignUpFormModel,
                  builder: (context, signUpFormModel) {
                    return TextFormField(
                      onChanged: (String email) {
                        signUpFormModel.setState(
                            (state) => state.setEmail(email),
                            onError: (err) => {print(err)});
                      },
                      decoration: InputDecoration(
                        errorText: signUpFormModel.hasError
                            ? signUpFormModel.error.message
                            : null,
                        prefixIcon: Icon(Icons.email),
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    );
                  },
                ),
                buildSizedBox(15),
                StateBuilder<SignUpFormModel>(
                  observe: () => _singletonSignUpFormModel,
                  builder: (context, signUpFormModel) {
                    return TextFormField(
                      onChanged: (String fullName) {
                        signUpFormModel.setState(
                            (state) => state.setFullName(fullName),
                             onError: (err) => {print(err)});
                      },
                      decoration: InputDecoration(
                        errorText: signUpFormModel.hasError
                            ? signUpFormModel.error.message
                            : null,
                        prefixIcon: Icon(Icons.person),
                        hintText: "Enter your full naame",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    );
                  },
                ),
                buildSizedBox(15),
                StateBuilder<SignUpFormModel>(
                  observe: () => _singletonSignUpFormModel,
                  builder: (_, signFormModel) {
                    return TextFormField(
                      onChanged: (String password) {
                        signFormModel.setState(
                            (state) => state.setPassword(password),
                             onError: (err) => {print(err)});
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        errorText: signFormModel.hasError
                            ? signFormModel.error.message
                            : null,
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Enter your password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    );
                  },
                ),
                buildSizedBox(15),
                StateBuilder(
                  // models: [_singletonSignUpFormModel],
                   observe: () => _singletonSignUpFormModel,
                  builder: (_, model) {
                    return MaterialButton(
                      onPressed: () {
                        if (_singletonSignUpFormModel.state.validateData()) {
                          // ignore: deprecated_member_use
                          _key.currentState.showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text("Data is invalid"),
                          ));
                        }
                      },
                      height: 55,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color:brandingColor,
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    );
                  },
                ),
                buildSizedBox(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account ?"),
                    // ignore: deprecated_member_use
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, signInRoute);
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  SizedBox buildSizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }
}