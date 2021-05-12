import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jaa_taa/commonComponet/AppColors.dart';
import 'package:jaa_taa/controller/ChatController.dart';

// ignore: must_be_immutable
class ChatOnBoard extends StatefulWidget {

  String reciverId;


  ChatOnBoard(this.reciverId);

  @override
  _ChatOnBoardState createState() => _ChatOnBoardState(reciverId);
}

class _ChatOnBoardState extends State<ChatOnBoard> {
  String reciverId;
  final box = GetStorage();

  _ChatOnBoardState(this.reciverId);

  ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Container(
              color: AppColors.white,
              margin: EdgeInsets.only(left: 10.0, bottom: 30.0),
              width: 300.0,
              child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    ////Field Needed: name, duration, course( Particular Course Id), examdate, item_image;
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 13.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'type massage'),
                      controller: chatController.smsTextController,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)))),
            ),
          ),
          InkWell(
            onTap: () async {
              print('Send button tapped');
              await chatController.sendChat(reciverId);
              await chatController.fetchChaList(reciverId);
              chatController.getSmsBoxNull();

              // chatController.getSmsBoxNull();
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              color: AppColors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 17, bottom: 15),
                child: Icon(
                  Icons.send_rounded,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          )
        ],
      ),
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: GetX<ChatController>(
        initState: (context) {
          chatController.fetchChaList(reciverId);
        },
        builder: (controller) {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.chatList.isBlank) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/chat.svg',
                      height: 50, width: 50),
                  SizedBox(height: 20),
                  Text('No chats')
                ],
              ),
            );
          } else {
            return Container(
              margin: EdgeInsets.only(bottom: 75),
              child: ListView.builder(
                  controller: chatController.scrollController,
                  itemCount: controller.chatList.length,
                  itemBuilder: (context, index) {
                    //  // if (chatController.scrollController.hasClients) {
                    //     chatController.scrollController.jumpTo(chatController.scrollController.position.maxScrollExtent);
                    // //  }

                    print('reciverId type: $reciverId');

                    return Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        // ignore: unrelated_type_equality_checks
                        child: controller.chatList[index].sender == box.read('userId')
                            ? Container(
                                alignment: Alignment.centerRight,
                                child: Card(
                                    elevation: 6.0,
                                    color: Colors.blue,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                          controller.chatList[index].message,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: AppColors.white)),
                                    )),
                              )
                            : Container(
                                alignment: Alignment.centerLeft,
                                child: Card(
                                    elevation: 6.0,
                                    color: Colors.green,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                          controller.chatList[index].message,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: AppColors.white)),
                                    )),
                              ));
                  }),
            );
          }
        },
      ),
    );
  }
}
