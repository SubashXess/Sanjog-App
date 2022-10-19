import 'dart:convert';

List<SearchModel> searchModelFromJson(String str) => List<SearchModel>.from(
    json.decode(str).map((x) => SearchModel.fromJson(x)));

String searchModelToJson(List<SearchModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchModel {
  String? id;
  String? familyId;
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
  String? status;

  SearchModel({
    this.id,
    this.familyId,
    this.acNo,
    this.boothNo,
    this.pageNo,
    this.serialNo,
    this.voterNo,
    this.position,
    this.name,
    this.gender,
    this.category,
    this.relationType,
    this.relationName,
    this.mobileNo,
    this.whatsappNo,
    this.photo,
    this.status,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        id: json["id"],
        familyId: json["family_id"],
        acNo: json["acNo"],
        boothNo: json["boothNo"],
        pageNo: json["pageNo"],
        serialNo: json["serialNo"],
        voterNo: json["voterNo"],
        position: json["position"],
        name: json["name"],
        gender: json["gender"],
        category: json["category"],
        relationType: json["relationType"],
        relationName: json["relationName"],
        mobileNo: json["mobileNo"],
        whatsappNo: json["whatsappNo"],
        photo: json["photo"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "family_id": familyId,
        "acNo": acNo,
        "boothNo": boothNo,
        "pageNo": pageNo,
        "serialNo": serialNo,
        "voterNo": voterNo,
        "position": position,
        "name": name,
        "gender": gender,
        "category": category,
        "relationType": relationType,
        "relationName": relationName,
        "mobileNo": mobileNo,
        "whatsappNo": whatsappNo,
        "photo": photo,
        "status": status,
      };
}
