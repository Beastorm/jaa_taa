import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jaa_taa/apiModule/PostListApi.dart';
import 'package:jaa_taa/apiModule/SavePostApi.dart';
import 'package:jaa_taa/apiModule/CheckSavePostApi.dart';
import 'package:jaa_taa/commonComponet/MyAlertDialog.dart';
import 'package:jaa_taa/commonComponet/MySnackbar.dart';
import 'package:jaa_taa/model/PostListModel.dart';

class SavePostController extends GetxController {
  List<bool> selections = List.generate(1, (_) => false).obs;
  MyAlertDialog myAlertDialog = MyAlertDialog();
  final box = GetStorage();
  var isLoading = true.obs;
  var postList = List<DatumPostList>();

  addSavePost(String postId) async {
    String userId = box.read('userId');
    myAlertDialog.alertDialog('Adding favourite post', '');
    var response = await SavePostApi.addSavePost(userId, postId);

    if (response.response == "true") {
      Get.back();
      MySnackbar.successSnackBar('Success', 'This post marked as favourite');
    } else {
      MySnackbar.errorSnackBar('Failed', 'Unable to save the post');
    }
  }
  Future<int> checkSavePost(String postId) async {
    print('inside chck');
    String userId = box.read('userId');
    myAlertDialog.alertDialog('Checking favourite post', '');
    var response = await CheckSavePostApi.checkSavePost(userId, postId);

    if (response.data != null) {
     // selections = List.generate(1, (_) => true).obs;
      Get.back();
      MySnackbar.successSnackBar('$response', 'This post marked as favourite');
      return 1;
    } else {
    //  selections = List.generate(1, (_) => false).obs;
      Get.back();
      MySnackbar.errorSnackBar('Failed $response', 'Unable to save the post');
      return 0;
    }
  }

  deleteSavePost(String id) async {
    myAlertDialog.alertDialog('Deleting favourite post', '');
    var response = await SavePostApi.deletetSavePost(id);

    if (response.response == "true") {
      Get.back();
      MySnackbar.successSnackBar('Success', 'Post deleted successfully');
    } else {
      MySnackbar.errorSnackBar('Failed', 'Unable to delete the post');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchFavPosts();
  }

  void fetchFavPosts() async {
    String userId = box.read('userId');
    try {
      isLoading(true);
      var posts = await SavePostApi.viewSavePost(userId);
      print('posts $posts');

      if (posts != null) {
        postList.assignAll(posts);
      }
    } finally {
      isLoading(false);
    }
  }
}
