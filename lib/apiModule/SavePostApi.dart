import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:jaa_taa/model/AddSavePostModel.dart';
import 'package:jaa_taa/model/PostListModel.dart';

class SavePostApi{

  static var client = http.Client();

  static Future<SavePostModel> addSavePost(String userId, String postId) async {

    var baseUrl = GlobalConfiguration().get('base_url');

    var response = await client.post('${baseUrl}savePost.php', body:{'uid':userId, 'pid':postId});

    print('base url: $response');

    print('login api statuscode: ${response.statusCode}');
    if(response.statusCode == 200){

      var jsonString = response.body;

      return savePostModelFromJson(jsonString);
    }
  }

  static Future<List<DatumPostList>> viewSavePost(String userId) async {

    var baseUrl = GlobalConfiguration().get('base_url');

    var response = await client.post('${baseUrl}allFavPost.php', body:{'uid':userId});

    print('base url: $response');

    print('view api statuscode: ${response.statusCode}');
    if(response.statusCode == 200){

      var jsonString = response.body;

      return postListModelFromJson(jsonString).data;
    }
  }

  static Future<SavePostModel> deletetSavePost(String id) async {

    var baseUrl = GlobalConfiguration().get('base_url');

    var response = await client.post('${baseUrl}deletePost.php', body:{'id':id});

    print('base url: $response');

    print('delete savepost api statuscode: ${response.statusCode}');
    if(response.statusCode == 200){

      var jsonString = response.body;

      return savePostModelFromJson(jsonString);
    }
  }
}