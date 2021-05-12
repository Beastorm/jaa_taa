import 'package:http/http.dart' as http;
import 'package:global_configuration/global_configuration.dart';
import 'package:jaa_taa/model/PrivacyAndTermsModel.dart';

class PrivacyAndTermsApi{
  static var client = http.Client();

  static Future<List<DatumPrivacy>> fetchPrivacy() async {
    var baseUrl = GlobalConfiguration().get('base_url');

    // box.write('schoolId', schoolId);
    //        box.write('teacherId', teacherId);

    var response = await client.post('${baseUrl}privacy.php');

    print('response privacy policy: ' + baseUrl);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return privacyModelFromJson(jsonString).data;
    }
  }

  static Future<List<DatumPrivacy>> fetchTerms() async {
    var baseUrl = GlobalConfiguration().get('base_url');

    // box.write('schoolId', schoolId);
    //        box.write('teacherId', teacherId);

    var response = await client.post('${baseUrl}terms.php');

    print('response terms and condition: ' + baseUrl);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return privacyModelFromJson(jsonString).data;
    }
  }
}