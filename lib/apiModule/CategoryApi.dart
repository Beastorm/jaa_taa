import 'package:get_storage/get_storage.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:jaa_taa/model/CategoryModel.dart';

class CategoryApi {
  static var client = http.Client();

  static Future<List<DatumCategory>> fetchCategories() async {
    var baseUrl = GlobalConfiguration().get('base_url');

    // box.write('schoolId', schoolId);
    //        box.write('teacherId', teacherId);

    var response = await client.post('${baseUrl}category.php');

    print('response categories: ' + baseUrl);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return categoryModelFromJson(jsonString).data;
    }
  }
}
