// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/Custom_Widgets/Button_custom.dart';
import 'package:store/Custom_Widgets/SnackBar_custom.dart';
import 'package:store/Custom_Widgets/Textfield_custom.dart';
import 'package:store/Services/PUT_pruduct.dart';
import 'package:store/Services/Products_model.dart';

// ignore: must_be_immutable
class UpdateProduct extends StatefulWidget {
  UpdateProduct({super.key});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? productName;

  String? Description;

  double? Price;

  String? Image;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)?.settings.arguments as ProductsModel?;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 145, 12, 12),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextfieldCustom(
                  'Product Name',
                  'Enter product name',
                  TextInputType.text,
                  onChanged: (value) {
                    productName = value;
                  },
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                TextfieldCustom(
                  'Descrption',
                  'Enter product Descrption',
                  TextInputType.text,
                  onChanged: (value) {
                    Description = value;
                  },
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                TextfieldCustom(
                  'price',
                  'Enter product description',
                  TextInputType.number,
                  onChanged: (value) {
                    // تحويل القيمة إلى double بشكل صحيح
                    Price = double.tryParse(value) ?? Price;
                  },
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextfieldCustom(
                  'Image ',
                  'Enter product image URL',
                  TextInputType.url,
                  onChanged: (value) {
                    Image = value;
                  },
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                ButtonCustom("Update", () async {
                  print("Button pressed: Starting update process");
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    await Update_Method(product);
                    print("Success: Product updated");
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Successfully updated product"),
                      ),
                    );
                  } catch (e) {
                    print("Error in update process: $e");
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error updating product: $e")),
                    );
                  }
                  setState(() {
                    isLoading = false;
                  });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future Update_Method(ProductsModel? product) async {
    try {
      final response = await PutPruduct().putPruduct(
        productId: product?.id,
        title: productName ?? product!.title,
        price:
            Price != null
                ? Price! 
                : product!.price,
        description: Description ?? product!.description,
        category: product!.category,
        image: Image ?? product.image,
      );
      if (response.containsKey('id')) {
        SnackbarCustom("Successfully updated product");
      } else {
        SnackbarCustom("Failed to update product: Invalid response");
      }
    } catch (e) {
      SnackbarCustom("Error updating product: $e");
    }
  }
}
