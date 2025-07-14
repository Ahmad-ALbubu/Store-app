import 'package:store/Services/ApiHelper.dart';

import 'package:store/Services/Products_model.dart';

class AllProduct {
  Future<List<ProductsModel>> getAllProduct() async {
    final response = await HelperApiGet().Get(
      url: 'https://fakestoreapi.com/products',
    );
    List<ProductsModel> products =
        (response as List<dynamic>)
            .map(
              (product) =>
                  ProductsModel.fromJson(product as Map<String, dynamic>),
            )
            .toList();
    print(
      "the url I used is : https://fakestoreapi.com/products and the data is $products",
    );
    return products;
  }
}
