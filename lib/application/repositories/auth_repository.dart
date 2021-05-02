import 'package:alummahbio/application/alummahbio_api.dart';
import 'package:alummahbio/application/classes/errors/common_error.dart';
import 'package:alummahbio/application/storage/localstorage.dart';
import 'package:alummahbio/application/storage/storage_keys.dart';
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
    try {
      var response = await AlummahbioApi.dio.post(
        "/api/auth/login",
        data: {"email": email, "password": password},
      );
      String accessToken = response.data['accessToken'];
      String expiresAt = response.data['expiresAt'];
      await LocalStorage.setItem(TOKEN, accessToken);
      await LocalStorage.setItem(TOKEN_EXPIRATION, expiresAt);
      return;
      
    } on DioError catch (e) {
      showNetworkError(e);
    }
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
          "userName": fullName,
          "email": email,
          "phoneNumber": phoneNumber,
          "password": password,
          "password_confirmation": passwordConfirmation,
        },
      );
      print(response);
    } on DioError catch (e) {
      showNetworkError(e);
    }
  }
}
