import 'package:get/get.dart';
import 'package:jaa_taa/apiModule/ProductDetailsApi.dart';
import 'package:jaa_taa/model/ProductDetailsModel.dart';

class PostDetailsController extends GetxController {
  var isLoading = true.obs;
  var postDetailsList = List<DatumProductDetails>();

  fetchPostDetails(String postId) async {
    try {
      isLoading(true);
      var postDetails = await PostDetailsApi.fetchPostsDetials(postId);
      print('postsdetails $postDetails');

      if (postDetails != null) {
        postDetailsList.assignAll(postDetails);
      }
    } finally {
      isLoading(false);
    }
  }
}
