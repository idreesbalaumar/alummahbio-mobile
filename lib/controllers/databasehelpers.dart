// import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class DatabaseHelper {
//   String serverUrl = "http://localhost:8000/api";
//   String serverUrlBeneficiaries = "http://localhost:8000/api/beneficiary";

//   var status;

//   var token;

//   //login function
//   loginData(String email, String password) async {
//     String myUrl = "$serverUrl/login";
//     final response = await http.post(myUrl,
//         headers: {'Accept': 'application/json'},
//         body: {"email": "$email", "password": "$password"});
//     status = response.body.contains('error');

//     var data = json.decode(response.body);

//     if (status) {
//       print('data : ${data["error"]}');
//     } else {
//       print('data : ${data["token"]}');
//       _save(data["token"]);
//     }
//   }
// }
