import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaa_taa/commonComponet/AppColors.dart';
import 'package:jaa_taa/controller/PostDetailsController.dart';
import 'package:jaa_taa/controller/SavePostController.dart';
import 'package:jaa_taa/view/ChatOnBoardScreen.dart';
import 'package:share/share.dart';

// class PostDetails extends StatelessWidget {
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     print('post id: $postId');
//     return
//
//
//
//   }
// }

class PostDetails extends StatefulWidget {
  // const PostDetails({Key key}) : super(key: key);
  String postId;
  String postUserId;

  PostDetails(this.postId, this.postUserId);

  @override
  _PostDetailsState createState() => _PostDetailsState(postId, postUserId);

}

class _PostDetailsState extends State<PostDetails> {
  String postId;
  String postUserId;
  SavePostController savePostController = Get.put(SavePostController());
  _PostDetailsState(this.postId, this.postUserId);
  int saveStatus;

  PostDetailsController postDetailsController =
      Get.put(PostDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Share.share('https://play.google.com/store/apps/details?id=com.jaataa');
                },
                child: Container(
                  height: 50,
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Share',
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18)),
                      SizedBox(width: 10),
                      Icon(Icons.share, color: AppColors.white),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Get.to(ChatOnBoard(postUserId));
                },
                child: Container(
                  height: 50,
                  color: Colors.teal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Chat',
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18)),
                        SizedBox(width: 10),
                        Icon(Icons.chat, color: AppColors.white),
                      ]),
                ),
              ),
            ),
          ],
        ),
        appBar: AppBar(title: Text('Post details')),
        body: Container(
          margin: EdgeInsets.only(bottom: 50),
          child: LimitedBox(
            maxHeight: double.infinity,
            child: ListView(
              children: [
                GetX<PostDetailsController>(
                  initState: (context) async {
                    await postDetailsController.fetchPostDetails(postId);
                    // saveStatus = await savePostController.checkSavePost(postId);
                    // if(saveStatus == 1){
                    //   savePostController.selections = List.generate(1, (_) => true);
                    // }else{
                    //   savePostController.selections = List.generate(1, (_) => false);
                    // }

                  },
                  builder: (controller) {
                    print('postid: $postId)');
                    if (controller.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(

                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.postDetailsList.length,
                          itemBuilder: (context, index) {
                            print(
                                'image ${controller.postDetailsList[index].image}'
                            );

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.network(
                                      controller.postDetailsList[index].image,
                                      height: 220,
                                      fit: BoxFit.fill),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12.0, right: 10),
                                      child: Text('Save add',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 18, top: 8),
                                      child: ToggleButtons(
                                        children: [Icon(Icons.favorite)],
                                        renderBorder: false,
                                        disabledColor: Colors.grey,
                                        selectedColor: Colors.red,
                                        onPressed: (int index) {
                                          setState(() {
                                            if(savePostController.selections[index]==false){
                                              savePostController.addSavePost(postId);
                                              print('isSelected false: ${savePostController.selections}');
                                            }else{
                                              print('isSelected true, in else: ${savePostController.selections}');
                                            }

                                            savePostController.selections[index] = !savePostController.selections[index];
                                          });
                                        },
                                        isSelected: savePostController.selections,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                      controller.postDetailsList[index].name,
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12.0, top: 0),
                                  child: Text(
                                      'Bdt ${controller.postDetailsList[index].price}',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500)),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0, top: 6),
                                      child: Text(
                                          'Condition: ${controller.postDetailsList[index].pcondition}',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                    SizedBox(width: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0, top: 6),
                                      child: Text(
                                          'Authentication: ${controller.postDetailsList[index].auth}',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 12.0, top: 15, right: 12),
                                  color: Colors.grey,
                                  height: 1,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12.0, top: 6),
                                  child: Text('Description',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12.0, top: 6),
                                  child: Text(
                                      '${controller.postDetailsList[index].description}',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 12.0, top: 15, right: 12),
                                  color: Colors.grey,
                                  height: 1,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12.0, top: 6),
                                  child: Text('Other details',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12.0, top: 6),
                                  child: Text(
                                      'Adress: ${controller.postDetailsList[index].address}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12.0, top: 6),
                                  child: Text(
                                      'City: ${controller.postDetailsList[index].city}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12.0, top: 6),
                                  child: Text(
                                      'Pincode: ${controller.postDetailsList[index].pcode}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12.0, top: 6),
                                  child: Text(
                                      'Brand: ${controller.postDetailsList[index].brand}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12.0, top: 6),
                                  child: Text(
                                      'Model: ${controller.postDetailsList[index].model}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12.0, top: 6),
                                  child: Text(
                                      'Edition: ${controller.postDetailsList[index].edition}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400)),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12.0, top: 6),
                                  child: Text(
                                      'Post uploaded:  ${controller.postDetailsList[index].createdAt}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300)),
                                ),
                                SizedBox(height: 20),
                              ],
                            );
                          });
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
