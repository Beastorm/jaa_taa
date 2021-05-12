import 'package:get/get.dart';
import 'package:jaa_taa/apiModule/CategoryApi.dart';
import 'package:jaa_taa/model/CategoryModel.dart';

class CategoryController extends GetxController {
  var isLoading = true.obs;
  var categoryList = List<DatumCategory>();
  //static var categoryListStatic = List<DatumCategory>();

  @override
  void onInit() {
    // TODO: implement onInit
    fetchCategories();
    super.onInit();
  }

  void fetchCategories() async {

    try {
      isLoading(true);
      var categories = await CategoryApi.fetchCategories();
      print('categories $categories');

      if (categories != null) {
        categoryList.assignAll(categories);
       // categoryListStatic.assignAll(categories);
      }
    } finally {
      isLoading(false);
    }
  }
}
