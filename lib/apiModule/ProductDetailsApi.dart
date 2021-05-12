import 'package:global_configuration/global_configuration.dart';
import 'package:jaa_taa/model/ProductDetailsModel.dart';
import 'package:http/http.dart' as http;

class PostDetailsApi {
  static var client = http.Client();

  static Future<List<DatumProductDetails>> fetchPostsDetials(
      String postId) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    // box.write('schoolId', schoolId);
    //        box.write('teacherId', teacherId);

    var response =
        await client.post('${baseUrl}postDetails.php', body: {'pid': postId});

    print('response postDetails: ' + baseUrl);

    if (response.statusCode == 200) {
      var jsonString = response.body;

      return productDetailsModelFromJson(jsonString).data;
    }
  }
}
