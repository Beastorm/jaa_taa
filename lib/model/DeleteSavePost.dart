// To parse this JSON data, do
//
//     final deletePostModel = deletePostModelFromJson(jsonString);

import 'dart:convert';

DeletePostModel deletePostModelFromJson(String str) => DeletePostModel.fromJson(json.decode(str));

String deletePostModelToJson(DeletePostModel data) => json.encode(data.toJson());

class DeletePostModel {
  DeletePostModel({
    this.data,
    this.response,
  });

  dynamic data;
  String response;

  factory DeletePostModel.fromJson(Map<String, dynamic> json) => DeletePostModel(
    data: json["data"],
    response: json["response"] == null ? null : json["response"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "response": response == null ? null : response,
  };
}
