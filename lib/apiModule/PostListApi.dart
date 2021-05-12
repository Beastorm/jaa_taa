import 'package:get_storage/get_storage.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:jaa_taa/model/CategoryModel.dart';
import 'package:jaa_taa/model/PostListModel.dart';

class PostApi {
  static var client = http.Client();

  static Future<List<DatumPostList>> fetchPosts(String categoryId) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    // box.write('schoolId', schoolId);
    //        box.write('teacherId', teacherId);

    var response = await client.post('${baseUrl}allPost.php', body:{'cat':categoryId});

    print('response postList: ' + baseUrl);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return postListModelFromJson(jsonString).data;
    }
  }

  static Future<List<DatumPostList>> fetchMyPosts(String userId) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    // box.write('schoolId', schoolId);
    //        box.write('teacherId', teacherId);

    var response = await client.post('${baseUrl}myPost.php', body:{'uid':userId});

    print('response postList: ' + baseUrl);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return postListModelFromJson(jsonString).data;
    }
  }
}
