// To parse this JSON data, do
//
//     final privacyModel = privacyModelFromJson(jsonString);

import 'dart:convert';

PrivacyModel privacyModelFromJson(String str) => PrivacyModel.fromJson(json.decode(str));

String privacyModelToJson(PrivacyModel data) => json.encode(data.toJson());

class PrivacyModel {
  PrivacyModel({
    this.data,
    this.response,
  });

  List<DatumPrivacy> data;
  String response;

  factory PrivacyModel.fromJson(Map<String, dynamic> json) => PrivacyModel(
    data: json["data"] == null ? null : List<DatumPrivacy>.from(json["data"].map((x) => DatumPrivacy.fromJson(x))),
    response: json["response"] == null ? null : json["response"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    "response": response == null ? null : response,
  };
}

class DatumPrivacy {
  DatumPrivacy({
    this.id,
    this.name,
    this.data,
  });

  String id;
  String name;
  String data;

  factory DatumPrivacy.fromJson(Map<String, dynamic> json) => DatumPrivacy(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    data: json["data"] == null ? null : json["data"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "data": data == null ? null : data,
  };
}
