import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:jaa_taa/model/AddSavePostModel.dart';

class CheckSavePostApi{

  static var client = http.Client();
  List<bool> selections;

  static Future<SavePostModel> checkSavePost(String userId, String postId) async {

    var baseUrl = GlobalConfiguration().get('base_url');

    var response = await client.post('${baseUrl}checkFavPost.php', body:{'uid':userId, 'pid':postId});

    print('base url: $response');

    print('login api statuscode: ${response.statusCode}');
    if(response.statusCode == 200){

      var jsonString = response.body;

      return savePostModelFromJson(jsonString);
    }
  }
}