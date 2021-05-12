// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.data,
    this.response,
  });

  List<DatumCategory> data;
  String response;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    data: json["data"] == null ? null : List<DatumCategory>.from(json["data"].map((x) => DatumCategory.fromJson(x))),
    response: json["response"] == null ? null : json["response"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    "response": response == null ? null : response,
  };
}

class DatumCategory {
  DatumCategory({
    this.id,
    this.name,
    this.image,
    this.description,
    this.tag,
    this.status,
  });

  String id;
  String name;
  String image;
  String description;
  String tag;
  String status;

  factory DatumCategory.fromJson(Map<String, dynamic> json) => DatumCategory(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    image: json["image"] == null ? null : json["image"],
    description: json["description"] == null ? null : json["description"],
    tag: json["tag"] == null ? null : json["tag"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "image": image == null ? null : image,
    "description": description == null ? null : description,
    "tag": tag == null ? null : tag,
    "status": status == null ? null : status,
  };
}
