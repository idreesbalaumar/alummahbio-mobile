import 'package:alummahbio/application/alummahbio_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

abstract class AuthRepository {
  Future signIn({
    @required String email,
    @required String password,
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
}
