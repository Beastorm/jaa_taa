import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaa_taa/controller/CategoryController.dart';
import 'package:jaa_taa/view/PostListScreen.dart';

class ViewAllCategory extends StatelessWidget {
  CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All categories'),
        ),

        body: GetX<CategoryController>(
          initState: (context) {},
          builder: (controller) {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return GridView.count(
                crossAxisCount: 2,
                children: new List<Widget>.generate(
                    controller.categoryList.length, (index) {
                  return InkWell(
                    onTap: () {
                      print(
                          'category Id: ${controller.categoryList[index].id}');
                      Get.to(PostListScreen(controller.categoryList[index].id));
                    },

                    child: new GridTile(
                      child: new Card(
                          margin: EdgeInsets.all(10),
                          child: new Center(
                            child: Column(
                              children: [
                                SizedBox(height: 10.0),
                                Expanded(
                                    child: Image.network(
                                        controller.categoryList[index].image)),
                                SizedBox(height: 10.0),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 15),
                                  child: Text(
                                    controller.categoryList[index].name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  );
                }),
              );
            }
          },
        ));
  }
}
