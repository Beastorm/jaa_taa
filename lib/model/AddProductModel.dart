// To parse this JSON data, do
//
//     final addPostModel = addPostModelFromJson(jsonString);

import 'dart:convert';

AddPostModel addPostModelFromJson(String str) => AddPostModel.fromJson(json.decode(str));

String addPostModelToJson(AddPostModel data) => json.encode(data.toJson());

class AddPostModel {
  AddPostModel({
    this.data,
    this.response,
    this.postId,
  });

  dynamic data;
  String response;
  String postId;

  factory AddPostModel.fromJson(Map<String, dynamic> json) => AddPostModel(
    data: json["data"],
    response: json["response"] == null ? null : json["response"],
    postId: json["post id"] == null ? null : json["post id"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "response": response == null ? null : response,
    "post id": postId == null ? null : postId,
  };
}
