// To parse this JSON data, do
//
//     final chatListModel = chatListModelFromJson(jsonString);

import 'dart:convert';

ChatListModel chatListModelFromJson(String str) => ChatListModel.fromJson(json.decode(str));

String chatListModelToJson(ChatListModel data) => json.encode(data.toJson());

class ChatListModel {
  ChatListModel({
    this.data,
    this.response,
  });

  List<DatumChatList> data;
  String response;

  factory ChatListModel.fromJson(Map<String, dynamic> json) => ChatListModel(
    data: json["data"] == null ? null : List<DatumChatList>.from(json["data"].map((x) => DatumChatList.fromJson(x))),
    response: json["response"] == null ? null : json["response"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    "response": response == null ? null : response,
  };
}

class DatumChatList {
  DatumChatList({
    this.id,
    this.receiver,
    this.sender,
    this.message,
    this.status,
    this.createdAt,
  });

  String id;
  String receiver;
  String sender;
  String message;
  String status;
  DateTime createdAt;

  factory DatumChatList.fromJson(Map<String, dynamic> json) => DatumChatList(
    id: json["id"] == null ? null : json["id"],
    receiver: json["receiver"] == null ? null : json["receiver"],
    sender: json["sender"] == null ? null : json["sender"],
    message: json["message"] == null ? null : json["message"],
    status: json["status"] == null ? null : json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "receiver": receiver == null ? null : receiver,
    "sender": sender == null ? null : sender,
    "message": message == null ? null : message,
    "status": status == null ? null : status,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
  };
}
