import 'package:flutter/material.dart';

class LikeCustom extends StatelessWidget {
  final int index;
  final List<bool> isLikedList;
  final ValueChanged<bool> onLikeChanged;

  const LikeCustom({
    super.key,
    required this.index,
    required this.isLikedList,
    required this.onLikeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onLikeChanged(!isLikedList[index]);
      },
      icon: Icon(
        isLikedList[index] ? Icons.favorite : Icons.favorite_border,
        color: isLikedList[index] ? Colors.red : Colors.grey[600],
      ),
    );
  }
}
