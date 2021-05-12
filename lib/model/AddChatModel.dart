// To parse this JSON data, do
//
//     final addChatModel = addChatModelFromJson(jsonString);

import 'dart:convert';

AddChatModel addChatModelFromJson(String str) => AddChatModel.fromJson(json.decode(str));

String addChatModelToJson(AddChatModel data) => json.encode(data.toJson());

class AddChatModel {
  AddChatModel({
    this.data,
    this.response,
  });

  dynamic data;
  String response;

  factory AddChatModel.fromJson(Map<String, dynamic> json) => AddChatModel(
    data: json["data"],
    response: json["response"] == null ? null : json["response"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "response": response == null ? null : response,
  };
}
