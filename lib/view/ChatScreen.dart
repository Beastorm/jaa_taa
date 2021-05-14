import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaa_taa/commonComponet/AppColors.dart';
import 'package:jaa_taa/controller/ChatController.dart';
import 'package:jaa_taa/view/ChatOnBoardScreen.dart';

class ChatScreen extends StatelessWidget {
  ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
            title: Text('Chat List'),
          ),
          body: LimitedBox(
            maxHeight: double.infinity,
            child: GetX<ChatController>(initState: (context) {
              chatController.fetchChatListPerson();
            }, builder: (controller) {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return SingleChildScrollView(
                  child: ListView.builder(
                      itemCount: controller.chatPersonList.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Get.to(ChatOnBoard(controller.chatPersonList[index].userid));
                            },
                            title: Container(
                              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                     Icon(Icons.person),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10.0, bottom: 15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 10.0),
                                            Text(
                                              controller.chatPersonList[index].name
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900),
                                            ),
                                            SizedBox(height: 10.0),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                );
              }
            }),
          ));
  }
}
