import 'package:flutter/material.dart';

class SnackbarCustom extends StatelessWidget {
  SnackbarCustom(String text, {super.key});
  String? text;
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(text!, style: TextStyle(fontSize: 16, color: Colors.white)),

      duration: const Duration(seconds: 2),
    );
  }
}
