import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:jaa_taa/model/SearchProductModel.dart';


class SearchPostApi {
  static var client = http.Client();

  static Future<List<DatumSearchProduct>> fetchPosts(String searchValue) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    // box.write('schoolId', schoolId);
    //        box.write('teacherId', teacherId);

    var response = await client.post('${baseUrl}allPost.php', body:{'searchValue':searchValue});

    print('response postList: ' + baseUrl);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return searchProductModelFromJson(jsonString).data;
    }
  }
}