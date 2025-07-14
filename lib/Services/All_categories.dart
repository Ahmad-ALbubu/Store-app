import 'package:store/Services/ApiHelper.dart';

class AllCategories {
  Future<List<String>> getAllCategories() async {
    final response = await HelperApiGet().Get(
      url: 'https://fakestoreapi.com/products/categories',
    );
    print(
      "the url I used is : https://fakestoreapi.com/products/categories and the data is $response",
    );
    return response as List<String>;
  }
}
