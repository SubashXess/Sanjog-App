import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sonjagapp/Constants/constants.dart';

class UpdateVoterUserModel {
  String? address;
  String? id;
  String? loginUserId;
  String? photo;
  String? position;
  String? category;
  String? mobile;
  String? wpNumber;
  String? dob;
  String? dom;
  String? bloodGroup;
  String? postBJP;
  String? socialOrg;
  String? updateAt;

  UpdateVoterUserModel({
    this.loginUserId,
    this.id,
    this.photo,
    this.position,
    this.category,
    this.mobile,
    this.wpNumber,
    this.address,
    this.dob,
    this.dom,
    this.bloodGroup,
    this.postBJP,
    this.socialOrg,
    this.updateAt,
  });

  factory UpdateVoterUserModel.fromJson(Map<String, dynamic> json) {
    return UpdateVoterUserModel(
      loginUserId: json['user_id'],
      id: json['id'],
      photo: json['photo'],
      position: json['position'],
      category: json['category'],
      mobile: json['mobile'],
      wpNumber: json['whatsappNo'],
      address: json['address'],
      dob: json['dob'],
      dom: json['dom'],
      bloodGroup: json['blood_group'],
      postBJP: json['postBJP'],
      socialOrg: json['soc_org'],
      updateAt: json['updateAt'],
    );
  }

  Map<String, dynamic> toJson() => {
        'user_id': loginUserId,
        'id': id,
        'photo': photo,
        'position': position,
        'category': category,
        'mobile': mobile,
        'whatsappNo': wpNumber,
        'address': address,
        'dob': dob,
        'dom': dom,
        'blood_group': bloodGroup,
        'postBJP': postBJP,
        'soc_org': socialOrg,
        'updateAt': updateAt,
      };

  // static List<UpdateVoterUserModel> updateModelFromJson(String str) =>
  //     List<UpdateVoterUserModel>.from(
  //         json.decode(str).map((x) => UpdateVoterUserModel.fromJson(x)));
  // static String updateModelToJson(List<UpdateVoterUserModel> data) =>
  //     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

// getUpdate({
//   String? address,
//   String? id,
//   String? loginUserId,
//   String? photo,
//   String? position,
//   String? category,
//   String? mobile,
//   String? wpNumber,
//   String? dob,
//   String? dom,
//   String? bloodGroup,
//   String? postBJP,
//   String? socialOrg,
// })

// Future<UpdateVoterUserModel> getUpdate(UpdateVoterUserModel user) async {
//   Client client = http.Client();
//   Uri uri = Uri.parse(APIs.USER_DATA_UPDATE);

//   try {
//     Response response = await client.put(uri, body: json.encode(user));
//     if (response.statusCode == 200) {
//       var jsonResponse = json.decode(response.body);
//       return jsonResponse;
//     } else {
//       return Future.error('Connection Error');
//     }
//   } catch (e) {
//     return Future.error('Unexpected Error $e');
//   }
// }
