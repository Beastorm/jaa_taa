import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:jaa_taa/model/LoginModel.dart';
import 'package:jaa_taa/model/RegisterModel.dart';

class RegisterApi {
  static var client = http.Client();

  static Future<RegisterModel> register(
      String name, String mobile, String email, String password) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    var response = await client.post('${baseUrl}register.php', body: {
      'name': name,
      'mobile': mobile,
      'email': email,
      'password': password
    });

    print('base url: $response');

    print('register api statuscode: ${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonString = response.body;

      return registerModelFromJson(jsonString);
    }
  }
}
