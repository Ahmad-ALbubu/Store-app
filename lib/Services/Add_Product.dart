import 'package:store/Services/ApiHelper.dart';

class AddProduct {
  Future<Map<String, dynamic>> addProduct({
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,

    String? token,
  }) async {
    Map<String, dynamic> data = await HelperApiPost().post(
      url: 'https://dummyjson.com/products/add',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
      },
      token: token,
    );
    return data;
  }
}
