import 'package:alummahbio/application/models/auth/sign_in_form_model.dart';
import 'package:alummahbio/router/route_constants.dart';
import 'package:alummahbio/utils/my_navigator.dart';
import 'package:alummahbio/values/images.dart';
import 'package:alummahbio/widgets/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
      ),
      body: Injector(
        inject: [Inject<SignInFormModel>(() => SignInFormModel())],
        builder: (context) {
          final _singletonSignInFormModel =
              RM.get<SignInFormModel>();
          return Container(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: <Widget>[
                Container(
                  height: 100,
                  child: Center(
                    child: Image.asset(Images.logo),
                  ),
                ),
                buildSizedBox(15),
                StateBuilder<SignInFormModel>(
                  observe: () => _singletonSignInFormModel,
                  builder: (context, signInFormModel) {
                    return TextFormField(
                      onChanged: (String email) {
                        signInFormModel.setState(
                            (state) => state.setEmail(email),
                            onError: (err) => {
                                  showSnackbar(
                                      color: Colors.red,
                                      key: _key,
                                      message: "${err.message}",
                                      context: context),
                                });
                      },
                      decoration: InputDecoration(
                        errorText: signInFormModel.hasError
                            ? signInFormModel.error.message
                            : null,
                        prefixIcon: Icon(Icons.email),
                        // hintText: "Enter your email",
                        labelText: 'Enter your email',
                        isDense: true,
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    );
                  },
                ),
                buildSizedBox(15),
                StateBuilder<SignInFormModel>(
                  observe: () => _singletonSignInFormModel,
                  builder: (_, signFormModel) {
                    return TextFormField(
                      onChanged: (String password) {
                        signFormModel.setState(
                            (state) => state.setPassword(password),
                            onError: (err) => {
                                  showSnackbar(
                                      color: Colors.red,
                                      key: _key,
                                      message: "${err.message}",
                                      context: context),
                                });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        errorText: signFormModel.hasError
                            ? signFormModel.error.message
                            : null,
                        prefixIcon: Icon(Icons.lock),
                        // hintText: "Enter your password",
                        labelText: 'Enter your password',
                        isDense: true,
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    );
                  },
                ),
                buildSizedBox(15),
                StateBuilder(
                  observe: () => _singletonSignInFormModel,
                  builder: (_, model) {
                    return MaterialButton(
                      onPressed: () {
                        if (!_singletonSignInFormModel.state.validateData()) {
                          {
                            showSnackbar(
                                key: _key,
                                color: Colors.red,
                                message:
                                    "Data is invalid, please fill the form before submitting!",
                                context: context);
                          }
                        } else {
                          _singletonSignInFormModel.setState(
                            (signInFormState) async {
                             await signInFormState.submitSignIn();
                             Navigator.pushNamed(context, homeRoute);
                            },
                            onError: (e) => {
                              showSnackbar(
                                  color: Colors.red,
                                  key: _key,
                                  message: "${e.message}",
                                  context: context),
                            },
                          );
                        }
                      },
                      height: 55,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: Theme.of(context).primaryColor,
                      child: Center(
                        child: Text(
                          "Sign In",
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
                    Text("Don't have an account ?"),
                    TextButton(
                      onPressed: () {
                        MyNavigator.goToSignUp(context);
                      },
                      child: Text(
                        "Sign Up",
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
