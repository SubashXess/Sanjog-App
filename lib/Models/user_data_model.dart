// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:intl/intl.dart';

List<UserDataModel> getVoterListFromJson(String str) =>
    List<UserDataModel>.from(
        json.decode(str).map((x) => UserDataModel.fromJson(x)));

String getVoterListToJson(List<UserDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((e) => e.toJson())));

class UserDataModel {
  String? id;
  String? userId;
  String? familyId; // add\
  String? status;
  String? acNo;
  String? boothNo;
  String? pageNo;
  String? serialNo;
  String? voterNo;
  String? adharNo;
  String? position;
  String? fname;
  String? mname;
  String? lname;
  String? gender;
  String? category;
  String? relationType;
  String? relationName;
  String? mobileNo;
  String? whatsappNo;
  String? photo;
  String address;
  String? dob;
  String? dom;
  String? bloodGroup;
  String? postBJP;
  String? socialOrg;
  String? createdAt; // add
  String? updatedAt; // add
  List<UserDataModel>? members;

  UserDataModel({
    required this.id,
    required this.userId,
    required this.familyId,
    required this.status,
    required this.acNo,
    required this.boothNo,
    required this.pageNo,
    required this.serialNo,
    required this.voterNo,
    required this.adharNo,
    required this.fname,
    required this.mname,
    required this.lname,
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
    required this.createdAt,
    required this.updatedAt,
    this.members,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      userId: json['user_id'],
      familyId: json['family_id'],
      status: json['status'],
      acNo: json['acNo'] ?? '',
      boothNo: json['boothNo'] ?? '',
      pageNo: json['pageNo'] ?? '',
      serialNo: json['serialNo'] ?? '',
      voterNo: json['voterNo'] ?? '',
      adharNo: json['adharNo'] ?? '',
      fname: json['name'] ?? '',
      mname: json['m_name'] ?? '',
      lname: json['l_name'] ?? '',
      gender: json['gender'] ?? '',
      category: json['category'] == '' ? null : json['category'],
      relationType: json['relationType'] ?? '',
      relationName: json['relationName'] ?? '',
      mobileNo: json['mobileNo'] ?? '',
      whatsappNo: json['whatsappNo'] ?? '',
      photo: json['photo'] ?? '',
      address: json['address'] ?? '',
      bloodGroup: json['blood_group'] == '' ? null : json['blood_group'],
      dob: json['dob'] ?? '',
      dom: json['dom'] ?? '',
      position: json['position'] == '' ? null : json['position'],
      postBJP: json['postBJP'] ?? '',
      socialOrg: json['soc_org'] == '' ? null : json['soc_org'],
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['upd_date'] ?? '',
      members: json['members'],
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id, // voter user id
      'user_id': userId, // login user id
      'family_id': familyId,
      'status': status,
      'acNo': acNo,
      'boothNo': boothNo,
      'pageNo': pageNo,
      'serialNo': serialNo,
      'voterNo': voterNo,
      'adharNo': adharNo,
      'name': fname,
      'm_name': mname,
      'l_name': lname,
      'gender': gender,
      'category': category,
      'relationType': relationType,
      'relationName': relationName,
      'mobileNo': mobileNo,
      'whatsappNo': whatsappNo,
      'photo': photo,
      'address': address,
      'blood_group': bloodGroup,
      'position': position,
      'dob': dob,
      'dom': dom,
      'postBJP': postBJP,
      'soc_org': socialOrg,
      'createdAt': createdAt,
      'upd_date': updatedAt,
      'members': members,
    };
  }
}
