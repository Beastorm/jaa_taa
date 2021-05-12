// To parse this JSON data, do
//
//     final postListModel = postListModelFromJson(jsonString);

import 'dart:convert';

PostListModel postListModelFromJson(String str) =>
    PostListModel.fromJson(json.decode(str));

String postListModelToJson(PostListModel data) => json.encode(data.toJson());

class PostListModel {
  PostListModel({
    this.data,
    this.response,
  });

  List<DatumPostList> data;
  String response;

  factory PostListModel.fromJson(Map<String, dynamic> json) => PostListModel(
        data: json["data"] == null
            ? null
            : List<DatumPostList>.from(
                json["data"].map((x) => DatumPostList.fromJson(x))),
        response: json["response"] == null ? null : json["response"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "response": response == null ? null : response,
      };
}

class DatumPostList {
  DatumPostList({
    this.id,
    this.cid,
    this.sid,
    this.pid,
    this.uid,
    this.name,
    this.pcondition,
    this.address,
    this.city,
    this.pcode,
    this.brand,
    this.model,
    this.edition,
    this.description,
    this.auth,
    this.price,
    this.image,
    this.tag,
    this.status,
    this.createdAt,
  });

  String id;
  String cid;
  String sid;
  String pid;
  String uid;
  String name;
  String pcondition;
  String address;
  String city;
  String pcode;
  String brand;
  String model;
  String edition;
  String description;
  String auth;
  String price;
  String image;
  String tag;
  String status;
  DateTime createdAt;

  factory DatumPostList.fromJson(Map<String, dynamic> json) => DatumPostList(
        id: json["id"] == null ? null : json["id"],
        cid: json["cid"] == null ? null : json["cid"],
        sid: json["sid"] == null ? null : json["sid"],
        pid: json["pid"] == null ? null : json["pid"],
        uid: json["uid"] == null ? null : json["uid"],
        name: json["name"] == null ? null : json["name"],
        pcondition: json["pcondition"] == null ? null : json["pcondition"],
        address: json["address"] == null ? null : json["address"],
        city: json["city"] == null ? null : json["city"],
        pcode: json["pcode"] == null ? null : json["pcode"],
        brand: json["brand"] == null ? null : json["brand"],
        model: json["model"] == null ? null : json["model"],
        edition: json["edition"] == null ? null : json["edition"],
        description: json["description"] == null ? null : json["description"],
        auth: json["auth"] == null ? null : json["auth"],
        price: json["price"] == null ? null : json["price"],
        image: json["image"] == null ? null : json["image"],
        tag: json["tag"] == null ? null : json["tag"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "cid": cid == null ? null : cid,
        "sid": sid == null ? null : sid,
        "pid": pid == null ? null : pid,
        "uid": uid == null ? null : uid,
        "name": name == null ? null : name,
        "pcondition": pcondition == null ? null : pcondition,
        "address": address == null ? null : address,
        "city": city == null ? null : city,
        "pcode": pcode == null ? null : pcode,
        "brand": brand == null ? null : brand,
        "model": model == null ? null : model,
        "edition": edition == null ? null : edition,
        "description": description == null ? null : description,
        "auth": auth == null ? null : auth,
        "price": price == null ? null : price,
        "image": image == null ? null : image,
        "tag": tag == null ? null : tag,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      };
}
