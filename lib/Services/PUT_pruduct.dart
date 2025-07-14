import 'package:store/Services/ApiHelper.dart';

class PutPruduct {
  Future<Map<String, dynamic>> putPruduct({
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
    required dynamic productId,
    String? token,
  }) async {
    Map<String, dynamic> data = await HelperApiPut().put(
      url: 'https://fakestoreapi.com/products/$productId',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
      },
      token: token,
    );
    print(
      "the url I used is: https://fakestoreapi.com/products/$productId and body: {'title': $title, 'price': $price, 'description': $description, 'category': $category, 'image': $image} and token: $token and the data is $data",
    );
    return data;
  }
}
