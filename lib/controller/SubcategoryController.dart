import 'package:get/get.dart';
import 'package:jaa_taa/apiModule/CategoryApi.dart';
import 'package:jaa_taa/apiModule/SubcategoryApi.dart';
import 'package:jaa_taa/model/CategoryModel.dart';
import 'package:jaa_taa/model/SubcategoryModel.dart';

class SubcategoryController extends GetxController {
  var isLoading = true.obs;
  var subCategoryList = List<DatumSubcategory>();
  //static var categoryListStatic = List<DatumCategory>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  fetchSubcategories(String categoryId) async {

    try {
      isLoading(true);
      var subcategories = await SubcategoryApi.fetchSubCategories(categoryId);
      print('subcategories cont $subcategories, categoryid: $categoryId');

      if (subcategories != null) {
        subCategoryList.assignAll(subcategories);
        // categoryListStatic.assignAll(categories);
      }
    } finally {
      isLoading(false);
    }
  }
}
