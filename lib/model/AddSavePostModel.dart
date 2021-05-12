// To parse this JSON data, do
//
//     final savePostModel = savePostModelFromJson(jsonString);

import 'dart:convert';

SavePostModel savePostModelFromJson(String str) => SavePostModel.fromJson(json.decode(str));

String savePostModelToJson(SavePostModel data) => json.encode(data.toJson());

class SavePostModel {
  SavePostModel({
    this.data,
    this.response,
  });

  dynamic data;
  String response;

  factory SavePostModel.fromJson(Map<String, dynamic> json) => SavePostModel(
    data: json["data"],
    response: json["response"] == null ? null : json["response"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "response": response == null ? null : response,
  };
}
