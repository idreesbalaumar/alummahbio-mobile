import 'package:alummahbio/application/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';

class AuthState {
  final AuthRepository _authRepository;

  AuthState(this._authRepository) : assert(_authRepository != null);

  Future signIn({
    @required String email,
    @required String password,
  }) async {
    await _authRepository.signIn(email: email, password: password);
  }

  Future signUp({
    @required String fullName,
    @required String email,
    @required String phoneNumber,
    @required String password,
    @required String passwordConfirmation,
  }) async {
    await _authRepository.signUp(
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}
