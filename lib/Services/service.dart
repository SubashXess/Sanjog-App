import 'dart:convert';

import 'package:sonjagapp/Constants/constants.dart';
import 'package:sonjagapp/Models/login_model.dart';
import 'package:http/http.dart' as http;

class Service {
  // login database


 
}

// class Service {
//   // get hospitals
//   static Future<List<LoginModel>> getUserLogindata() async {
//     final response = await http.get(Uri.parse(APIs.DBAPI));
//      var data = jsonDecode(response.body.toString());
//     try {
//       if (response.statusCode == 200) {
        
//       } else {
//         throw Exception('Unexpected error occured!');
//       }
//     } catch (e) {
//       throw Exception(e.toString());
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

