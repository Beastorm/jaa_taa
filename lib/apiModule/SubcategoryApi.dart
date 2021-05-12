import 'package:get_storage/get_storage.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:jaa_taa/model/CategoryModel.dart';
import 'package:jaa_taa/model/SubcategoryModel.dart';

class SubcategoryApi {
  static var client = http.Client();

  static Future<List<DatumSubcategory>> fetchSubCategories(String categoryId) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    var response = await client.post('${baseUrl}allSubCategory.php', body: {'cat_id': categoryId});

    // body:{'email':email,

    print('response subcategoriesapi: ' + categoryId);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return subcategoryModelFromJson(jsonString).data;
    }
  }
}
