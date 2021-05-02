import 'package:alummahbio/base_url.dart';
import 'package:dio/dio.dart';

class AlummahbioApi {
  static BaseOptions _baseOptions = new BaseOptions(baseUrl: BASE_URL);

// For unauthenticated apis
  static Dio dio = Dio(_baseOptions);  

//Authenticated routes
  static Dio dioAuth(){
    return Dio();
  }
}