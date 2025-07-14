import 'package:flutter/material.dart';
import 'package:store/Custom_Widgets/GridView_custom.dart';
import 'package:store/Services/All_product.dart';
import 'package:store/Services/Products_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A3C34), // Deep teal background
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
          255,
          145,
          12,
          12,
        ), // Warm orange app bar
        title: const Text('New Trend', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Add navigation or functionality here if needed
            },
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List<ProductsModel>>(
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
      ),
    );
  }
}
