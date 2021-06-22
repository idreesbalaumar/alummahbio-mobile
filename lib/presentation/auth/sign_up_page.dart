import 'package:alummahbio/application/models/auth/sign_up_form_model.dart';
import 'package:alummahbio/utils/my_navigator.dart';
import 'package:alummahbio/values/branding_color.dart';
import 'package:alummahbio/values/images.dart';
import 'package:alummahbio/widgets/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:validators/validators.dart' as validator;

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
        key: _key,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
      ),
      body: Injector(
        inject: [Inject<SignUpFormModel>(() => SignUpFormModel())],
        builder: (context) {
          final _singletonSignUpFormModel = RM.get<SignUpFormModel>();
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
                        // hintText: "Enter your full name",
                        labelText: 'Enter your full name',
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
                StateBuilder<SignUpFormModel>(
                  observe: () => _singletonSignUpFormModel,
                  builder: (context, signUpFormModel) {
                    return TextFormField(
                      onChanged: (String fullName) {
                        signUpFormModel.setState(
                            (state) => state.setPhoneNumber(fullName),
                            onError: (err) => {print(err)});
                      },
                      decoration: InputDecoration(
                        errorText: signUpFormModel.hasError
                            ? signUpFormModel.error.message
                            : null,
                        prefixIcon: Icon(Icons.phone),
                        // hintText: "Enter your phone number",
                        labelText: 'Enter your phone number',
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
                StateBuilder<SignUpFormModel>(
                  observe: () => _singletonSignUpFormModel,
                  builder: (_, model) {
                    return TextFormField(
                      onChanged: (String confirmPassword) {
                        model.setState(
                            (state) =>
                                state.setPasswordConfirmation(confirmPassword),
                            onError: (err) => {print(err)});
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        errorText: model.hasError
                            ? model.error.message
                            : null,
                        prefixIcon: Icon(Icons.lock),
                        // hintText: "Confirm password",
                        fillColor: Colors.white,
                        labelText: 'Confirm password',
                        isDense: true,
                        filled: true,
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
                        if (!_singletonSignUpFormModel.state.validateData()) {
                          showSnackbar(
                              key: _key,
                              message:
                                  'Data is invalid, please fill the form before submitting!',
                              color: Colors.red,
                              // context: context
                              );
                        } else {
                          _singletonSignUpFormModel.state.submitSignUp();
                        }
                      },
                      height: 55,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: brandingColor,
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
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
                    TextButton(
                      onPressed: () {
                        MyNavigator.goToSinIn(context);
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
