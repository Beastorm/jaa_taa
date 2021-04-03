// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.data,
    this.response,
    this.msg,
  });

  Data data;
  String response;
  String msg;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    response: json["response"] == null ? null : json["response"],
    msg: json["msg"] == null ? null : json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "response": response == null ? null : response,
    "msg": msg == null ? null : msg,
  };
}

class Data {
  Data({
    this.id,
    this.userid,
    this.name,
    this.mobile,
    this.password,
    this.email,
    this.address,
    this.logo,
    this.banner,
    this.shopname,
    this.description,
    this.tag,
    this.status,
    this.createdAt,
  });

  String id;
  String userid;
  String name;
  String mobile;
  String password;
  String email;
  String address;
  String logo;
  String banner;
  String shopname;
  String description;
  String tag;
  String status;
  DateTime createdAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] == null ? null : json["id"],
    userid: json["userid"] == null ? null : json["userid"],
    name: json["name"] == null ? null : json["name"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    password: json["password"] == null ? null : json["password"],
    email: json["email"] == null ? null : json["email"],
    address: json["address"] == null ? null : json["address"],
    logo: json["logo"] == null ? null : json["logo"],
    banner: json["banner"] == null ? null : json["banner"],
    shopname: json["shopname"] == null ? null : json["shopname"],
    description: json["description"] == null ? null : json["description"],
    tag: json["tag"] == null ? null : json["tag"],
    status: json["status"] == null ? null : json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "userid": userid == null ? null : userid,
    "name": name == null ? null : name,
    "mobile": mobile == null ? null : mobile,
    "password": password == null ? null : password,
    "email": email == null ? null : email,
    "address": address == null ? null : address,
    "logo": logo == null ? null : logo,
    "banner": banner == null ? null : banner,
    "shopname": shopname == null ? null : shopname,
    "description": description == null ? null : description,
    "tag": tag == null ? null : tag,
    "status": status == null ? null : status,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
  };
}
