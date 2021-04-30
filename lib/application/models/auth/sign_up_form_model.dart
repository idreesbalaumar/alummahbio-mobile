import 'package:alummahbio/application/classes/errors/common_error.dart';

class SignUpFormModel {
  String fullName;
  String phoneNumber;
  String email;
  String password;
  String profilePicture;
  String organization;

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

  void setPassword(String password) {
    //check the password validation
    if (password.length < 6) {
      throw CommonError(message: "Password should be more than 6 characters");
    }

    this.password = password;
  }

  bool validateData() {
    return this.email != null &&
        this.password != null &&
        this.password.length > 6 &&
        this.validateEmail(this.email);
  }

  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}