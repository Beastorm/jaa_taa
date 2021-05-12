import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaa_taa/commonComponet/AppColors.dart';
import 'package:jaa_taa/controller/AddPostController.dart';
import 'package:jaa_taa/controller/CategoryController.dart';
import 'package:jaa_taa/controller/SearchPostController.dart';
import 'package:jaa_taa/view/PostDetails.dart';

class DataSeacrch extends SearchDelegate<String> {
  SearchPostListController searchPostListController =
      Get.put(SearchPostListController());
  AddPostController addPostController = Get.put(AddPostController());
  CategoryController categoryController = Get.put(CategoryController());
  final suggestionList = ['Vehicles', 'Mobile', 'Home & Living', 'Electronics'];
  String q;

  @override
  List<Widget> buildActions(BuildContext context) {
    // action for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //show some result based on selection

    return LimitedBox(
      maxHeight: double.infinity,
      child: GetX<SearchPostListController>(initState: (context) {
        searchPostListController.fetchCategories(query);
      }, builder: (controller) {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          child: GetX<AddPostController>(
                        initState: (context) {
                          addPostController
                              .getCategoryName(categoryController.categoryList);
                          //  subcategoryController.fetchSubcategories(addPostController.selectedCategoryId.value);
                          //addPostController.selectedCategory.value = categoryController.categoryList[0].name;
                        },
                        builder: (controller) {
                          return Row(
                            children: [
                              //category sort
                              Container(
                                width: 150,
                                height:60,
                                child: DropdownButton<String>(
                                  items: controller
                                      .getCategoryName(
                                          categoryController.categoryList)
                                      .map((String stringItemValue) {
                                    return DropdownMenuItem<String>(
                                      value: stringItemValue,
                                      child: Text(stringItemValue),
                                    );
                                  }).toList(),
                                  onChanged: (String selectedItem) {
                                    addPostController.getCategiryId(
                                        categoryController.categoryList,
                                        selectedItem);

                                    addPostController.selectedCategoryId.value =
                                        controller.getCategiryId(
                                            categoryController.categoryList,
                                            selectedItem);

                                    searchPostListController.fetchCategories(addPostController.selectedCategoryId.value);
                                    print(
                                        'getCatId: ${addPostController.selectedCategoryId}');

                                    print(
                                        'getcategory name: ${addPostController.selectedCategory}');
                                    addPostController.selectedCategory.value =
                                        selectedItem;
                                  },
                                  value: addPostController.selectedCategory.value,
                                ),
                              ),
                              SizedBox(width: 20),
                              //sort
                              Container(
                                width: 150,
                                height:60,
                                child: DropdownButton<String>(
                                  items: controller
                                      .getSortName()
                                      .map((String stringItemValue) {
                                    return DropdownMenuItem<String>(
                                      value: stringItemValue,
                                      child: Text(stringItemValue),
                                    );
                                  }).toList(),
                                  onChanged: (String selectedItem) {
                                    addPostController.selectedSortname.value =
                                        selectedItem;
                                    searchPostListController.fetchCategories(addPostController.selectedSortname.value);

                                    print(
                                        'selected sort item name: ${addPostController.selectedSortname}');

                                  },
                                  value: addPostController.selectedSortname.value,
                                ),
                              ),
                            ],
                          );
                        },
                      )) //Category dorpdown
                    ]),


                ListView.builder(
                    itemCount: controller.postList.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            Get.to(PostDetails(controller.postList[index].pid,
                                controller.postList[index].uid));
                          },
                          title: Container(
                            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                        controller.postList[index].image,
                                        width: 120,
                                        height: 100,
                                        fit: BoxFit.fill),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 10.0, bottom: 15.0),
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
                                            controller
                                                .postList[index].description
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
              ],
            ),
          );
        }
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when someone searches for something
    return Container(
      child: Center(child: Text('Search by name')),
      color: AppColors.white,
    );
  }
}
