// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.msg,
    this.response,
  });

  String msg;
  String response;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    msg: json["msg"] == null ? null : json["msg"],
    response: json["response"] == null ? null : json["response"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg == null ? null : msg,
    "response": response == null ? null : response,
  };
}
