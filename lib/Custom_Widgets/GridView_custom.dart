import 'package:flutter/material.dart';
import 'package:store/Custom_Widgets/Like_custom.dart';
import 'package:store/Services/Products_model.dart';

class GridViewCustom extends StatefulWidget {
  const GridViewCustom({required this.products, super.key});

  final List<ProductsModel> products;

  @override
  State<GridViewCustom> createState() => _GridViewCustomState();
}

class _GridViewCustomState extends State<GridViewCustom> {
  late List<bool> _isLikedList;

  @override
  void initState() {
    super.initState();
    _isLikedList = List<bool>.filled(widget.products.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        final item = widget.products[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "UpdateProduct", arguments: item);
          },
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.white,
            shadowColor: const Color(0xFF1A3C34).withOpacity(0.3),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            height: 1.0,
                            color: Color(0xFF1A3C34),
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '\$${item.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 145, 12, 12),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        LikeCustom(
                          index: index,
                          isLikedList: _isLikedList,
                          onLikeChanged: (isLiked) {
                            setState(() {
                              _isLikedList[index] = isLiked;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 90,
                  left: 55,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      item.image,
                      height: 90,
                      width: 100,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              const Icon(Icons.error, color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
