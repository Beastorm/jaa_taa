import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jaa_taa/apiModule/CategoryApi.dart';
import 'package:jaa_taa/apiModule/PostListApi.dart';
import 'package:jaa_taa/model/CategoryModel.dart';
import 'package:jaa_taa/model/PostListModel.dart';

class PostListController extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var postList = List<DatumPostList>();
  final box = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchMyPosts();
  }

  void fetchPosts(String categoryId) async {
    try {
      isLoading(true);
      var posts = await PostApi.fetchPosts(categoryId);
      print('posts $posts');

      if (posts != null) {
        postList.assignAll(posts);
      }
    } finally {
      isLoading(false);
    }
  }
  void fetchMyPosts() async {
    String userId = box.read('userId');
    try {
      isLoading(true);
      var posts = await PostApi.fetchMyPosts(userId);
      print('my posts $posts');

      if (posts != null) {
        postList.assignAll(posts);
      }
    } finally {
      isLoading(false);
    }
  }
}
