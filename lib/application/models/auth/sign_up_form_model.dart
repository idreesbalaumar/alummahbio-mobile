import 'package:alummahbio/application/classes/errors/common_error.dart';
import 'package:alummahbio/application/state/auth_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignUpFormModel {
  final AuthState _authState = Injector.get<AuthState>();
  String fullName;
  String email;
  String phoneNumber;
  String password;
  String passwordConfirmation;
  // String profilePicture;
  // String organization;

  void setEmail(String email) {
    //check the email validation
    if (!validateEmail(email)) {
      throw CommonError(message: "Invalid email");
    }

    this.email = email;
  }

  void setFullName(String fullName) {
    this.fullName = fullName;
  }

  void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  void setPassword(String password) {
    // check the password validation
    if (password.length < 6) {
      throw CommonError(message: "Password lenght should be more than 6 chars");
    }
    this.password = password;
  }

  void setPasswordConfirmation(String passwordConfirmation) {
    if (this.password != passwordConfirmation) {
      throw CommonError(message: "Password does not match");
    }
    this.passwordConfirmation = passwordConfirmation;
  }

  bool validateData() {
    return this.fullName != null &&
        this.email != null &&
        this.validateEmail(this.email) &&
        this.validatePhoneNumber(this.phoneNumber) &&
        this.password != null &&
        this.password.length >= 6 &&
        this.password == this.passwordConfirmation;
  }

  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool validatePhoneNumber(String phoneNumber) {
    return RegExp(r'(234)[0-9]{10}').hasMatch(phoneNumber);
  }

  void submitSignUp() async {
    await _authState.signUp(
      fullName: this.fullName,
      email: this.email,
      phoneNumber: this.phoneNumber,
      password: this.password,
      passwordConfirmation: this.passwordConfirmation,
    );
  }
}
