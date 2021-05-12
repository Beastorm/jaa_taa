import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jaa_taa/commonComponet/AppColors.dart';
import 'package:jaa_taa/controller/AddPostController.dart';
import 'package:jaa_taa/controller/CategoryController.dart';
import 'package:jaa_taa/controller/SubcategoryController.dart';

class AddPostScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String radioValue;
  AddPostController addPostController = Get.put(AddPostController());
  CategoryController categoryController = Get.put(CategoryController());
  SubcategoryController subcategoryController =
      Get.put(SubcategoryController());

  List<String> categoryIdList = List();
  var currentSelectedItem = 'A';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.themeColorLight,
          title: Text('Add Post'),
        ),
        body: GetX<AddPostController>(initState: (context) {
          addPostController.getCategoryName(categoryController.categoryList);
        //  subcategoryController.fetchSubcategories(addPostController.selectedCategoryId.value);
          //addPostController.selectedCategory.value = categoryController.categoryList[0].name;
        }, builder: (controller) {
          return ListView(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 15),
                          child: Text(
                            'Choose Category',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 15.0, top: 15),
                        //   child: Text(
                        //     'Choose Subcategory',
                        //     style: TextStyle(
                        //         fontWeight: FontWeight.w600, fontSize: 14),
                        //   ),
                        // ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        //Category dorpdown
                        DropdownButton<String>(
                          items: controller
                              .getCategoryName(categoryController.categoryList)
                              .map((String stringItemValue) {
                            return DropdownMenuItem<String>(
                              value: stringItemValue,
                              child: Text(stringItemValue),
                            );
                          }).toList(),
                          onChanged: (String selectedItem) {
                            addPostController.getCategiryId(
                                categoryController.categoryList, selectedItem);

                            addPostController.selectedCategoryId.value =
                                controller.getCategiryId(
                                    categoryController.categoryList,
                                    selectedItem);

                            subcategoryController.fetchSubcategories(addPostController.selectedCategoryId.value);
                            // subcategoryController.fetchSubcategories(addPostController.selectedCategoryId.value);

                            print(
                                'subcate: ${subcategoryController.fetchSubcategories(addPostController.selectedCategoryId.value)}');

                            print(
                                'getCatId: ${addPostController.selectedCategoryId}');

                            print(
                                'getcategory name: ${addPostController.selectedCategory}');
                            addPostController.selectedCategory.value =
                                selectedItem;
                          },
                          value: addPostController.selectedCategory.value,
                        ),
                        // DropdownButton<String>(
                        //   items: controller
                        //       .getSubCategoryName(
                        //           subcategoryController.subCategoryList)
                        //       .map((String stringItemValue) {
                        //     return DropdownMenuItem<String>(
                        //       value: stringItemValue,
                        //       child: Text(stringItemValue),
                        //     );
                        //   }).toList(),
                        //   onChanged: (String selectedItem) {
                        //
                        //    //  addPostController.selectedSubCategory.value = selectedItem;
                        //    //
                        //    // addPostController.getsubCategiryId(subcategoryController.subCategoryList, selectedItem);
                        //    //
                        //    // addPostController.selectedSubCategoryId.value = controller.getsubCategiryId(subcategoryController.subCategoryList, selectedItem);
                        //    //
                        //    //  subcategoryController.fetchSubcategories(addPostController.selectedCategoryId.value);
                        //
                        //     print(
                        //         'subcate: ${subcategoryController.fetchSubcategories(addPostController.selectedCategoryId.value)}');
                        //
                        //     print(
                        //         'getsubCatId: ${addPostController.selectedSubCategoryId}');
                        //
                        //     print(
                        //         'getsubcategory name: ${addPostController.selectedSubCategory}');
                        //
                        //   },
                        //   value: addPostController.selectedSubCategory.value,
                        // ),
                      ],
                    ),

                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 15),
                      child: Text(
                        'Choose Condition',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ),
                    RadioListTile(
                      title: Text("Used"),
                      value: 1,
                      activeColor: AppColors.themeColor,
                      groupValue: addPostController.usedOrNew.value,
                      selected: addPostController.usedOrNew.value == 1,
                      toggleable: true,
                      onChanged: (value) {
                        addPostController.usedOrNew.value = value;
                      },
                    ),
                    RadioListTile(
                      title: Text("New"),
                      value: 2,
                      activeColor: AppColors.themeColor,
                      groupValue: addPostController.usedOrNew.value,
                      selected: addPostController.usedOrNew.value == 2,
                      toggleable: true,
                      onChanged: (value) {
                        addPostController.usedOrNew.value = value;
                      },
                    ),

                    //
                    //     var nameTextController = new TextEditingController();
                    // var addressTextController = new TextEditingController();
                    // var cityTextController = new TextEditingController();
                    // var postCodeTextController = new TextEditingController();
                    // var brandController = new TextEditingController();
                    // var modelController = new TextEditingController();
                    // var editionController = new TextEditingController();
                    // var descriptionTextController = new TextEditingController();
                    // var priceTextController = new TextEditingController();

//Name TextField
                    Container(
                      height: 50,
                      margin:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                      child: TextFormField(
                          controller: controller.nameTextController,
                          validator: (input) =>
                              input.length < 1 ? "please enter name" : null,
                          decoration: InputDecoration(
                            hintText: 'Enter the name',
                            labelText: 'Name',
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.w400,
// light
                              fontStyle: FontStyle.normal,
                            ),
                            border: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: AppColors.themeColor)),
                          )),
                    ),

//Address TextField
                    Container(
                      height: 50,
                      margin:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                      child: TextFormField(
                          validator: (input) =>
                              input.length < 1 ? "please enter address" : null,
                          controller: controller.addressTextController,
                          decoration: InputDecoration(
                            hintText: 'Enter address',
                            labelText: 'Address',
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.w400,
// light
                              fontStyle: FontStyle.normal,
                            ),
                            border: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: AppColors.themeColor)),
                          )),
                    ),

//City TextField
                    Container(
                      height: 50,
                      margin:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                      child: TextFormField(
                          controller: controller.cityTextController,
                          validator: (input) =>
                              input.length < 1 ? "please enter city" : null,
                          decoration: InputDecoration(
                            hintText: 'Enter City',
                            labelText: 'City',
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.w400,
// light
                              fontStyle: FontStyle.normal,
                            ),
                            border: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: AppColors.themeColor)),
                          )),
                    ),

//Postcode TextField
                    Container(
                      height: 50,
                      margin:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                      child: TextFormField(
                          controller: controller.postCodeTextController,
                          validator: (input) => input.length < 1
                              ? "please enter post code"
                              : null,
                          decoration: InputDecoration(
                            hintText: 'Enter post code',
                            labelText: 'Post code',
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.w400,
// light
                              fontStyle: FontStyle.normal,
                            ),
                            border: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: AppColors.themeColor)),
                          )),
                    ),

//Brand TextField
                    Container(
                      height: 50,
                      margin:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                      child: TextFormField(
                          controller: controller.brandController,
                          decoration: InputDecoration(
                            hintText: 'Enter brand name',
                            labelText: 'Enter Brand (Optional)',
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.w400,
// light
                              fontStyle: FontStyle.normal,
                            ),
                            border: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: AppColors.themeColor)),
                          )),
                    ),

//Model TextField
                    Container(
                      height: 50,
                      margin:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                      child: TextFormField(
                          controller: controller.modelController,
                          decoration: InputDecoration(
                            hintText: 'Enter Model name',
                            labelText: 'Model (Optional)',
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.w400,
// light
                              fontStyle: FontStyle.normal,
                            ),
                            border: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: AppColors.themeColor)),
                          )),
                    ),

//Edition TextField
                    Container(
                      height: 50,
                      margin:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                      child: TextFormField(
                          controller: controller.editionController,
                          decoration: InputDecoration(
                            hintText: 'Enter edition',
                            labelText: 'Edition (Optional)',
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.w400,
// light
                              fontStyle: FontStyle.normal,
                            ),
                            border: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: AppColors.themeColor)),
                          )),
                    ),

//Description textfield
                    Container(
                      height: 50,
                      margin:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                      child: TextFormField(
                          controller: controller.descriptionTextController,
                          decoration: InputDecoration(
                            hintText: 'Enter Description',
                            labelText: 'Description',
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.w400,
// light
                              fontStyle: FontStyle.normal,
                            ),
                            border: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: AppColors.themeColor)),
                          )),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 15),
                      child: Text(
                        'Authenticity',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ),

                    RadioListTile(
                      title: Text("Original"),
                      value: 1,
                      activeColor: AppColors.themeColor,
                      groupValue: addPostController.authenticity.value,
                      selected: addPostController.authenticity.value == 1,
                      toggleable: true,
                      onChanged: (value) {
                        addPostController.authenticity.value = value;
                      },
                    ),
                    RadioListTile(
                      title: Text("Refurbished"),
                      value: 2,
                      activeColor: AppColors.themeColor,
                      groupValue: addPostController.authenticity.value,
                      selected: addPostController.authenticity.value == 2,
                      toggleable: true,
                      onChanged: (value) {
                        addPostController.authenticity.value = value;
                      },
                    ),

//price textfield
                    Container(
                      height: 50,
                      margin:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                      child: TextFormField(
                          controller: controller.priceTextController,
                          validator: (input) =>
                              input.length < 1 ? "please enter price" : null,
                          decoration: InputDecoration(
                            hintText: 'Enter price',
                            labelText: 'Price (Tk)',
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.w400,
// light
                              fontStyle: FontStyle.normal,
                            ),
                            border: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: AppColors.themeColor)),
                          )),
                    ),

                    SizedBox(height: 30),
                    InkWell(
                        onTap: () {
                          controller.getImage(ImageSource.gallery);
                          //getAlertDilog(appColors);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 14.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_outlined,
                                color: AppColors.themeColorLight,
                              ),
                              SizedBox(width: 10.0),
                              Text('Choose image',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        )),

                    Obx(() {
                      return Image.file(
                        File(controller.selectedImagePath.value),
                        width: 100.0,
                        height: 70.0,
                      );
                    }),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Container(
                        height: 40,
                        margin:
                            EdgeInsets.only(left: 40.0, right: 40.0, top: 34.0),
                        child: RaisedButton(
                            color: AppColors.themeColor,
                            child: Text(
                              'Add Post',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.white),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                controller.addPost();
                                print('add function calling');
                              } else {
                                Get.snackbar('Empty fileds',
                                    'Please enter all the fields');
                              }
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }));
  }

// List<String> getCategoryName() {
//   List<String> categoryNameList = List();
//
//   List<DatumCategory> categoryList = categoryController.categoryList;
//
//   for (var categories in categoryList) {
//     categoryNameList.add(categories.name);
//     categoryIdList.add(categories.id);
//
//     print('name ${categories.name}');
//   }
//   return categoryNameList;
// }
//
// String getCategiryId(String catName) {
//   // List<String> categoryId = List();
//   String currentCateId;
//   List<DatumCategory> categoryList = categoryController.categoryList;
//
//   for (var categories in categoryList) {
//     if (catName == categories.name) {
//       currentCateId = categories.id;
//       print('currentCateId in loop $currentCateId');
//     }
//   }
//   return currentCateId;
// }
}
