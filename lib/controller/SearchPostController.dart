import 'package:get/get.dart';
import 'package:jaa_taa/apiModule/SearchApi.dart';
import 'package:jaa_taa/model/SearchProductModel.dart';

class SearchPostListController extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var postList = List<DatumSearchProduct>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void fetchCategories(String searchValue) async {
    try {
      isLoading(true);
      var posts = await SearchPostApi.fetchPosts(searchValue);
      print('posts $posts');

      if (posts != null) {
        postList.assignAll(posts);
      }
    } finally {
      isLoading(false);
    }
  }
}