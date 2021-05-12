import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:jaa_taa/model/AddChatModel.dart';
import 'package:jaa_taa/model/ChatListModel.dart';

class ChatListAPi {
  static var client = http.Client();


  static Future<List<DatumChatList>> fetchChatlistApi(String senderId, String reciverId) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    var response = await client.post('${baseUrl}allChat.php', body:{'sender':senderId, 'receiver': reciverId});

    if(response.statusCode == 200){
      return chatListModelFromJson(response.body).data;
    }
  }

  static Future<AddChatModel> sendSms(
      String userId, String reciverId, String message) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    //input: 1. sender(sender userid)*
    // input: 2. receiver(receiver userid)*
    // input: 3. message( User Message)*

    var response = await client.post('${baseUrl}addChat.php',
        body: {'sender': userId, 'receiver': reciverId, 'message': message});

    print('base url: $response');
    print('userId: $userId, reciverId: $reciverId, message: $message');

    print('statuscode: ${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonString = response.body;

      return addChatModelFromJson(jsonString);
    }
  }
}