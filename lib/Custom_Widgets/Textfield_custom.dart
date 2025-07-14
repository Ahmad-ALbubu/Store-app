import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextfieldCustom extends StatelessWidget {
  TextfieldCustom(
    this.LableText,
    this.HntText,
    this.keyboardType, {
    super.key,
    required Null Function(dynamic value) onChanged,
    required TextInputType textInputType,
  });
  TextEditingController _controller = TextEditingController();
  String? LableText;
  String? HntText;
  TextInputType? keyboardType;
  Function(dynamic value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: onChanged,

      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: LableText!,
        labelStyle: TextStyle(
          color: Colors.grey[600],
          fontWeight: FontWeight.w500,
        ),
        hintText: HntText!,
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontStyle: FontStyle.italic,
        ),
        prefixIcon: Icon(Icons.edit, color: Colors.black, size: 20),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red[400]!, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red[400]!, width: 2),
        ),
      ),
      style: TextStyle(
        fontSize: 18,
        color: Colors.black87,
        fontWeight: FontWeight.w400,
      ),
      cursorColor: Colors.blueAccent,
    );
  }
}
