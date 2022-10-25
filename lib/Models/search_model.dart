import 'dart:convert';

List<SearchModelForVoterList> searchModelFromJson(String str) =>
    List<SearchModelForVoterList>.from(
        json.decode(str).map((x) => SearchModelForVoterList.fromJson(x)));

String searchModelToJson(List<SearchModelForVoterList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchModelForVoterList {
  String? acNo;
  String? boothNo;
  String? pageNo;
  String? serialNo;
  String? voterNo;
  String? adharNo;
  String? position;
  String? name;
  String? gender;
  String? category;
  String? relationType;
  String? relationName;
  String? mobileNo;
  String? whatsappNo;

  SearchModelForVoterList({
    this.acNo,
    this.boothNo,
    this.pageNo,
    this.serialNo,
    this.voterNo,
    this.adharNo,
    this.position,
    this.name,
    this.gender,
    this.category,
    this.relationType,
    this.relationName,
    this.mobileNo,
    this.whatsappNo,
  });

  factory SearchModelForVoterList.fromJson(Map<String, dynamic> json) =>
      SearchModelForVoterList(
        acNo: json["acNo"],
        boothNo: json["boothNo"],
        pageNo: json["pageNo"],
        serialNo: json["serialNo"],
        voterNo: json["voterNo"],
        adharNo: json['adharNo'],
        position: json["position"],
        name: json["name"],
        gender: json["gender"],
        category: json["category"],
        relationType: json["relationType"],
        relationName: json["relationName"],
        mobileNo: json["mobileNo"],
        whatsappNo: json["whatsappNo"],
      );

  Map<String, dynamic> toJson() => {
        "acNo": acNo,
        "boothNo": boothNo,
        "pageNo": pageNo,
        "serialNo": serialNo,
        "voterNo": voterNo,
        'adharNo': adharNo,
        "position": position,
        "name": name,
        "gender": gender,
        "category": category,
        "relationType": relationType,
        "relationName": relationName,
        "mobileNo": mobileNo,
        "whatsappNo": whatsappNo,
      };
}
