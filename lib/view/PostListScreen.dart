import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaa_taa/commonComponet/AppColors.dart';
import 'package:jaa_taa/controller/PostListController.dart';
import 'package:jaa_taa/view/PostDetails.dart';

class PostListScreen extends StatelessWidget {
  PostListController postListController = Get.put(PostListController());
  String categorieId;

  PostListScreen(this.categorieId);

  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
      appBar: AppBar(title: Text('Post Details')),
      body:

      LimitedBox(
        maxHeight: double.infinity,
        child: GetX<PostListController>(initState: (context) {
          postListController.fetchPosts(categorieId);
        }, builder: (controller) {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: ListView.builder(
                  itemCount: controller.postList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Get.to(PostDetails(controller.postList[index].pid, controller.postList[index].uid));
                        },
                        title: Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.network(controller.postList[index].image,
                                      width: 120, height: 100, fit: BoxFit.fill),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 10.0, bottom: 15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10.0),
                                        Text(
                                          controller.postList[index].name
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900),
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                          controller.postList[index].description
                                              .toString(),
                                          maxLines: 2,
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                        Text(
                                          'BDT ${controller.postList[index].price.toString()}',
                                          maxLines: 2,
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w900),
                                        ),
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
      ),
    );
  }
}
