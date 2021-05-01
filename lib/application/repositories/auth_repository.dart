import 'package:alummahbio/application/alummahbio_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

abstract class AuthRepository {
  Future signIn({
    @required String email,
    @required String password,
  });

  Future signUp({
    @required String fullName,
    @required String email,
    @required String phoneNumber,
    @required String password,
    @required String passwordConfirmation,
  });
}

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future signIn({String email, String password}) async {
    var response = await AlummahbioApi.dio.post(
      "/api/auth/login",
      data: {"email": email, "password": password},
    );
    print(response);
    // throw UnimplementedError();
  }

  @override
  Future signUp({
    String fullName,
    String email,
    String phoneNumber,
    String password,
    String passwordConfirmation,
  }) async {
    try {
      var response = await AlummahbioApi.dio.post(
        "/api/auth/register",
        data: {
          "userName" : fullName,
          "email" : email,
          "phoneNumber" : phoneNumber,
          "password" : password,
          "password_confirmation" : passwordConfirmation,

        },
      );
      print(response);
    } on DioError catch (e) {
      print(e.response);
    }
  }
}
