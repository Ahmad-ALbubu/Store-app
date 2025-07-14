 //this file has formal call in main to get or put or post product



         //put or post (and change a defult value to be new value)


 /*Future Update_Method(ProductsModel? product) async 
 {
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

  //**************************************************************** */
}*/
//                      this for get all in main 

/*
      FutureBuilder<List<ProductsModel>>(
          future: AllProduct().getAllProduct(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No products found'));
            }

            final products = snapshot.data!;
            return GridViewCustom(products: products);
          },
        ),
        */