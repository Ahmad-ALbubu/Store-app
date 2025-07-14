import 'package:store/Services/ApiHelper.dart';

import 'package:store/Services/Products_model.dart';

class SpecificCategories {
  Future<List<ProductsModel>> getSpecificCategories(String categoryName) async {
    final response = await HelperApiGet().Get(
      url: 'https://fakestoreapi.com/products/category/$categoryName',
    );
    List<ProductsModel> products =
        (response as List<dynamic>)
            .map(
              (product) =>
                  ProductsModel.fromJson(product as Map<String, dynamic>),
            )
            .toList();
    return products;
  }
}
