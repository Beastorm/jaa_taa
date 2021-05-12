// To parse this JSON data, do
//
//     final subcategoryModel = subcategoryModelFromJson(jsonString);

import 'dart:convert';

SubcategoryModel subcategoryModelFromJson(String str) => SubcategoryModel.fromJson(json.decode(str));

String subcategoryModelToJson(SubcategoryModel data) => json.encode(data.toJson());

class SubcategoryModel {
  SubcategoryModel({
    this.data,
    this.response,
  });

  List<DatumSubcategory> data;
  String response;

  factory SubcategoryModel.fromJson(Map<String, dynamic> json) => SubcategoryModel(
    data: json["data"] == null ? null : List<DatumSubcategory>.from(json["data"].map((x) => DatumSubcategory.fromJson(x))),
    response: json["response"] == null ? null : json["response"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    "response": response == null ? null : response,
  };
}

class DatumSubcategory {
  DatumSubcategory({
    this.id,
    this.parent,
    this.name,
    this.status,
  });

  String id;
  String parent;
  String name;
  String status;

  factory DatumSubcategory.fromJson(Map<String, dynamic> json) => DatumSubcategory(
    id: json["id"] == null ? null : json["id"],
    parent: json["parent"] == null ? null : json["parent"],
    name: json["name"] == null ? null : json["name"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "parent": parent == null ? null : parent,
    "name": name == null ? null : name,
    "status": status == null ? null : status,
  };
}
