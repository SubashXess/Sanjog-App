import 'dart:convert';

import 'package:http/http.dart' as http;

class UserDataModel {
  int uid;
  String? acNo;
  String? boothNo;
  String? pageNo;
  String? serialNo;
  String? voterNo;
  String? name;
  String? gender;
  String? category;
  String? relationType;
  String? relationName;
  String? mobileNo;
  String? whatsappNo;
  String? photo;
  List<UserDataModel>? members;

  UserDataModel({
    required this.uid,
    required this.acNo,
    required this.boothNo,
    required this.pageNo,
    required this.serialNo,
    required this.voterNo,
    required this.name,
    required this.gender,
    required this.category,
    required this.relationType,
    required this.relationName,
    required this.mobileNo,
    required this.whatsappNo,
    required this.photo,
    this.members,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      uid: json['uid'],
      acNo: json['acNo'],
      boothNo: json['boothNo'],
      pageNo: json['pageNo'],
      serialNo: json['serialNo'],
      voterNo: json['voterNo'],
      name: json['name'],
      gender: json['gender'],
      category: json['category'],
      relationType: json['relationType'],
      relationName: json['relationName'],
      mobileNo: json['mobileNo'],
      whatsappNo: json['whatsappNo'],
      photo: json['photo'],
    );
  }

  Map<String, Object?> toJson() {
    return {
      'uid': uid,
      'acNo': acNo,
      'boothNo': boothNo,
      'pageNo': pageNo,
      'serialNo': serialNo,
      'voterNo': voterNo,
      'name': name,
      'gender': gender,
      'category': category,
      'relationType': relationType,
      'relationName': relationName,
      'mobileNo': mobileNo,
      'whatsappNo': whatsappNo,
      'photo': photo
    };
  }

  // Data from server

  static Future<List<UserDataModel>> getUserData() async {
    final http.Response response = await http.get(Uri.parse('')); // api
    try {
      if (response.statusCode == 200) {
        List serverResponse = json.decode(response.body);
        return serverResponse
            .map((data) => UserDataModel.fromJson(data))
            .toList();
      } else {
         return throw Exception('Unexpected error occured!');
      }
    } catch (e) {
      return throw Exception(e.toString());
    }
  }
}


