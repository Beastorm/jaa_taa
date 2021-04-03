import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:jaa_taa/model/LoginModel.dart';
class LoginApi{

  static var client = http.Client();

  static Future<LoginModel> login(String email, String password) async {

    var baseUrl = GlobalConfiguration().get('base_url');

    var response = await client.post('${baseUrl}login.php', body:{'email':email, 'password':password});

    print('base url: $response');

    print('login api statuscode: ${response.statusCode}');
    if(response.statusCode == 200){

      var jsonString = response.body;

      return loginModelFromJson(jsonString);
    }
  }
}