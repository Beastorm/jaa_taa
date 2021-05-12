import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jaa_taa/apiModule/AddPostApi.dart';
import 'package:jaa_taa/apiModule/CategoryApi.dart';
import 'package:jaa_taa/commonComponet/AppColors.dart';
import 'package:jaa_taa/commonComponet/MyAlertDialog.dart';
import 'package:jaa_taa/commonComponet/MySnackbar.dart';
import 'package:jaa_taa/controller/CategoryController.dart';
import 'package:jaa_taa/model/CategoryModel.dart';
import 'package:jaa_taa/model/SubcategoryModel.dart';
import 'package:jaa_taa/view/HomeScreen.dart';
import 'package:jaa_taa/view/Pages.dart';
import 'package:jaa_taa/view/PostSuccessfullyScreen.dart';

class AddPostController extends GetxController {
  MyAlertDialog myAlertDialog = MyAlertDialog();
  var isLoading = true.obs;
  static var categoryListStatic = List<DatumCategory>();
  var usedOrNew = 1.obs;
  var authenticity = 1.obs;

  // var selectedCategory =
  //     CategoryControllerForAdd.categoryListStatic[0].name.toString().obs;

  //Need to fix
  var selectedCategory = 'Vehicles'.obs;
  var selectedCategoryId = '0'.obs;
  var selectedSubCategory = 'Car'.obs;
  var selectedSubCategoryId = '1'.obs;

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  var selectedSortname = 'new'.obs;

  var nameTextController = new TextEditingController();
  var addressTextController = new TextEditingController();
  var cityTextController = new TextEditingController();
  var postCodeTextController = new TextEditingController();
  var brandController = new TextEditingController();
  var modelController = new TextEditingController();
  var editionController = new TextEditingController();
  var descriptionTextController = new TextEditingController();
  var priceTextController = new TextEditingController();

  final box = GetStorage();
  var userId;

  void addPost() async {
    userId = box.read('userId');

    print(
        'addpost data....:  category: ${selectedCategoryId.value}, subcate: ${selectedSubCategoryId.value}, usrId: $userId, name: ${nameTextController.text.trim()}, '
            'condition: ${checkConditionType(usedOrNew.value)}, address: ${addressTextController.text.trim()}, city: ${cityTextController.text.trim()},'
            ' postcode: ${postCodeTextController.text.trim()}, brand: ${brandController.text.trim()}, model: ${modelController.text.trim()}, '
            'edition: ${editionController.text.trim()}, description: ${descriptionTextController.text.trim()}, auth: ${authenticity.value},'
            ' price :${priceTextController.text.trim()}, selectedPath: ${selectedImagePath.value}'
            );



    myAlertDialog.alertDialog("Posting, please wait..", '');
    print('Calling post text');
    var response = await AddPostApi.addPostApi(
        selectedCategoryId.value,
        selectedSubCategoryId.value, userId,
        nameTextController.text.trim(), checkConditionType(usedOrNew.value), addressTextController.text.trim(), cityTextController.text.trim(),
        postCodeTextController.text.trim(), brandController.text.trim(), modelController.text.trim(), editionController.text.trim(),
        descriptionTextController.text.trim(), checkAuthenticityType(authenticity.value), priceTextController.text.trim(), selectedImagePath.value, "tag");



    print('respons addpost controller: ${response.response}');
    if (response != null) {
      if (response.response.toString() == 'true') {

        // Get.off(ChapterScreen(''));
        Get.back();
        Get.to(PostAddedSuccess());
        MySnackbar.successSnackBar(
            'Successful'.toUpperCase(), 'Post Added successfully');
      } else {
        MySnackbar.infoSnackBar('Over Size !',
            'Post can not be uploaded due to over size of the image');
      }
    } else {
      MySnackbar.infoSnackBar('Server down !', 'Please try after sometime');
    }
  }

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
              .toStringAsFixed(2) +
              'Mb';
    } else {
      Get.snackbar('Opps!', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.themeColorLight,
          colorText: AppColors.white);
    }
  }

  List<String> getCategoryName(List<DatumCategory> categoryList) {
    List<String> categoryNameList = List();

    for (var categories in categoryList) {
      categoryNameList.add(categories.name);

      print('name ${categories.name}');
    }
    return categoryNameList;
  }

  String getCategiryId(List<DatumCategory> categoryList, String catName) {
    String currentCateId;

    for (var categories in categoryList) {
      if (catName == categories.name) {
        currentCateId = categories.id;
        print('currentCateId in loop $currentCateId');
      }
    }
    return currentCateId;
  }

  List<String> getSubCategoryName(List<DatumSubcategory> subcategoryList) {
    List<String> subCategoryNameList = List();

    for (var subcategories in subcategoryList) {
      subCategoryNameList.add(subcategories.name);

      print('subcate name inloop ${subcategories.name}');
    }
    return subCategoryNameList;
  }

  List<String> getSortName(){
    List<String> sortList = ['high', 'low', 'new', 'old'];
    return sortList;
  }

  String getsubCategiryId(List<DatumSubcategory> subcategoryList,
      String subcatName) {
    String currentCateId;

    for (var subcategories in subcategoryList) {
      if (subcatName == subcategories.name) {
        currentCateId = subcategories.id;
        print('currentsubCateId in loop $currentCateId');
      }
    }
    return currentCateId;
  }



  String checkConditionType(int type) {
    switch (type) {
      case 1:
        return "Used";
      case 2:
        return "New";
    }
    return "Used";
  }

  String checkAuthenticityType(int type) {
    switch (type) {
      case 1:
        return "Original";
      case 2:
        return "Refurbished";
    }
    return "Original";
  }
}



