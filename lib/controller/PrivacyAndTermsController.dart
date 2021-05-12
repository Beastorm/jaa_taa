import 'package:get/get.dart';
import 'package:jaa_taa/apiModule/PrivacyAndTermsApi.dart';
import 'package:jaa_taa/model/PrivacyAndTermsModel.dart';

class PrivacyAndTermsController extends GetxController {
  var isLoading = true.obs;
  var privacyList = List<DatumPrivacy>();
  var termsList = List<DatumPrivacy>();

  void fetchPrivacy() async {
    try {
      isLoading(true);
      var privacy = await PrivacyAndTermsApi.fetchPrivacy();
      print('privacy $privacy');

      if (privacy != null) {
        privacyList.assignAll(privacy);
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchTerms() async {
    try {
      isLoading(true);
      var terms = await PrivacyAndTermsApi.fetchTerms();
      print('terms $terms');

      if (terms != null) {
        termsList.assignAll(terms);
      }
    } finally {
      isLoading(false);
    }
  }
}
