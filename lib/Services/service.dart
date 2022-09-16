// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sonjagapp/Constants/constants.dart';
import 'package:sonjagapp/Models/login_model.dart';

// class ApiClient {
//   static void login(String username, String password) async {
//     final http.Response response = await http
//         .get(Uri.parse('${APIs.LOGIN_API}?u_name=$username&mobile=$password'));
//     try {
//       var data = jsonDecode(response.body.toString());

//       if (response.statusCode == 200) {
//         print(data['message']);
//       } else {
//         print(data['message']);
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }


 // Future<List<TestDoctorModel>> getDoctors() async {
  //   final response = await http.get(
  //       Uri.parse('http://mymotherslap.com/mslap_panel/api/getCategory.php'));
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     for (Map i in data) {
  //       list.add(TestDoctorModel.fromJson(i));
  //     }
  //     return list;
  //   } else {
  //     return list;
  //   }
  // }
