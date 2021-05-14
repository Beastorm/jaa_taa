import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jaa_taa/apiModule/ChatListApi.dart';
import 'package:jaa_taa/commonComponet/MyAlertDialog.dart';
import 'package:jaa_taa/model/ChatListModel.dart';
import 'package:jaa_taa/model/ChatListPerson.dart';

class ChatController extends GetxController {
  var isLoading = true.obs;
  var chatList = List<DatumChatList>();
  var chatPersonList = List<DatumChatListPerson>();
  var userId;
  final box = GetStorage();

  MyAlertDialog myAlertDialog = MyAlertDialog();
  var smsTextController = new TextEditingController();
  final scrollController = ScrollController();

  fetchChaList(String receverId) async {
    userId = box.read('userId');
    print('chatController: senderId $userId, reciverId: $receverId');

    try {
      isLoading(true);
       var chats = await ChatListAPi.fetchChatlistApi(userId, receverId);
      //var chats = await ChatListAPi.fetchChatlistApi("USER4950", 'USER1234');


      if (chats.isNotEmpty) {
        chatList.assignAll(chats);
      }
    } finally {
      isLoading(false);
    }
  }



  sendChat(String reciverId) async {
    //Alert dilog
    myAlertDialog.alertDialog('Sending', '');
    userId = box.read('userId');

    print(
        'chat controller send: userId $userId, reciverId $reciverId}, sms ${smsTextController.text}');

    var smsResponse = await ChatListAPi.sendSms(
        userId, reciverId, smsTextController.text.trim());

    print('response ${smsResponse.response}');
    if (smsResponse != null) {
      Get.back();

      if (smsResponse.response == 'true') {
      } else {
        Get.snackbar('Server down', 'Please try again later');
      }
    }
  }

  getSmsBoxNull() {
    smsTextController.clear();
  }

  getScrollDown(){
    Timer(
      Duration(milliseconds: 10),
          () => scrollController.jumpTo(scrollController.position.maxScrollExtent),
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getScrollDown();
    super.onInit();
  }

  void fetchChatListPerson() async {
    String userId = box.read('userId');
    try {
      isLoading(true);
      var chatPersons = await ChatListAPi.viewChatListPerson(userId);
      print('chatlist person $chatPersons');

      if (chatPersons != null) {
        chatPersonList.assignAll(chatPersons);
      }
    } finally {
      isLoading(false);
    }
  }
}
