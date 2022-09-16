// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sonjagapp/Constants/constants.dart';

class UserDataModel {
  String? uid;
  String? status;
  String? acNo;
  String? boothNo;
  String? pageNo;
  String? serialNo;
  String? voterNo;
  String? position;
  String? name;
  String? gender;
  String? category;
  String? relationType;
  String? relationName;
  String? mobileNo;
  String? whatsappNo;
  String? photo;
  String? address;
  String? dob;
  String? dom;
  String? bloodGroup;
  String? postBJP;
  String? socialOrg;
  List<UserDataModel>? members;

  UserDataModel({
    required this.uid,
    required this.status,
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
    required this.address,
    required this.dob,
    required this.dom,
    required this.bloodGroup,
    required this.position,
    required this.postBJP,
    required this.socialOrg,
    this.members,
  });

  //  "id": "1",
  //   "acNo": "1212",
  //   "boothNo": "1",
  //   "pageNo": "1",
  //   "serialNo": "1",
  //   "voterNo": "ASDG23456",
  //   "position": "voter",
  //   "name": "Santosh Jena",
  //   "gender": "Male",
  //   "category": "A",
  //   "relationType": "Son",
  //   "relationName": "Mohan Jena",
  //   "mobileNo": "7682564389",
  //   "whatsappNo": "7689878953",
  //   "photo": null,
  // "status": "1"

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      uid: json['id'],
      status: json['status'],
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
      address: json['address'],
      bloodGroup: json['bloodGroup'],
      dob: json['dob'],
      dom: json['dom'],
      position: json['position'],
      postBJP: json['postBJP'],
      socialOrg: json['socialOrg'],
    );
  }

  Map<String, Object?> toJson() {
    return {
      'uid': uid,
      'status': status,
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
      'photo': photo,
      'address': address,
      'bloodGroup': bloodGroup,
      'position': position,
      'dob': dob,
      'dom': dom,
      'postBJP': postBJP,
      'socialOrg': socialOrg,
    };
  }

  // Data from server

  static Future<List<UserDataModel>> getUserData(
      String boothNo, String pageNo) async {
    final http.Response response = await http.get(Uri.parse(
        '${APIs.USER_DATA_API}?boothNo=$boothNo&pageNo=$pageNo')); // api  USER_DATA_API
    try {
      if (response.statusCode == 200) {
        print('Data received');
        List serverResponse = json.decode(response.body);
        print('Server Response : $serverResponse');
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
