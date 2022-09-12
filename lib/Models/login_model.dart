import 'package:http/http.dart' as http;

import '../Constants/constants.dart';

class LoginModel {
  int? uid;
  String? userlevel;
  String? username;
  String? phone;

  LoginModel(
      {required this.uid,
      required this.userlevel,
      required this.username,
      required this.phone});

  factory LoginModel.fromMap(Map<String, dynamic> res) {
    return LoginModel(
        uid: res['uid'],
        userlevel: res['userlevel'],
        username: res['username'],
        phone: res['phone']);
  }

  Map<String, Object?> toMap() => {
        'uid': uid,
        'userlevel': userlevel,
        'username': username,
        'phone': phone,
      };
}
