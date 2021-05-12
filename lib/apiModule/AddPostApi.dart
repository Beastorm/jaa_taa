import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:jaa_taa/model/AddProductModel.dart';

class AddPostApi {
  // 1. category(post category)*
  // 2. subcategory(post subcategory)*
  // 3.user(userid)*
  // 4.name(post name)*
  // 5. condition(product condition)[also please check website form for better understanding]*
  // 6. address(user address )*
  // 7. category(user city)*
  // 8. pincode(user pincode)*
  // 9. brand(product brand) [Optional]
  // 10. model(product model) [Optional]
  // 11. edition(product edition) [Optional]
  // 12. description(product description)*
  // 13. auth(product authentication)[also please check website form for better understanding]*
  // 14. price(product price)*
  // 15. picpath(product single image)*
  // 16. tag(product tag)[also please check website form for better understanding]*

  static var client = http.Client();

  static Future<AddPostModel> addPostApi(
      String categoryId,
      String subcategoryId,
      String userId,
      String name,
      String condition,
      String address,
      String city,
      String pincode,
      String brand,
      String model,
      String edition,
      String description,
      String auth,
      String price,
      var picPath,
      String tag) async {
    print(
        'addpost api data....:  category: $categoryId, subcate: $subcategoryId, usrId: $userId, name: $name, '
        'condition: $condition, address: $address, city: $city,'
        ' postcode: $pincode, brand: $brand, model: $model, '
        'edition: $edition, description: $description, auth: $auth,'
        ' price :$price, selectedPath: $picPath, tag: $tag');

    final String url = '${GlobalConfiguration().getValue('base_url')}addPost.php';
    var request = http.MultipartRequest('POST', Uri.parse(url));

    print('Add chapter controller baseurl  $url');

    // 'category': categoryId,
    // 'subcategory': subcategoryId,
    // 'user': userId,
    // 'name': name,
    // 'condition': condition,
    // 'address': address,
    // 'city': city,
    // 'pincode': pincode,
    // 'brand': brand,
    // 'model': model,
    // 'edition': edition,
    // 'description': description,
    // 'auth': auth,
    // 'price': price,
    // 'picpath': picPath,
    // 'tag': tag,

    request.fields['category'] = categoryId;
    request.fields['subcategory'] = subcategoryId;
    request.fields['user'] = userId;
    request.fields['name'] = name;
    request.fields['name'] = name;
    request.fields['condition'] = condition;
    request.fields['address'] = address;
    request.fields['city'] = city;
    request.fields['pincode'] = pincode;
    request.fields['brand'] = brand;
    request.fields['model'] = model;
    request.fields['edition'] = edition;
    request.fields['description'] = description;
    request.fields['auth'] = auth;
    request.fields['price'] = price;
    request.fields['tag'] = tag;

    request.files
        .add(await http.MultipartFile.fromPath('picpath', picPath.toString()));

    var response = await request.send();
    print('Response stream: ${response.stream}');
    print('Response status code: ${response.statusCode}');
    final res = await http.Response.fromStream(response);
    print('Response body: ${res.body}');

    print('statuscode: ${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonString = res.body.toString();

      return addPostModelFromJson(jsonString);
    }
  }
}
