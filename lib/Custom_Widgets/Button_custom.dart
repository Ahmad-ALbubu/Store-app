import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonCustom extends StatelessWidget {
  ButtonCustom(this.labelText, this.onTap, {super.key});
  void Function()? onTap; // دالة اختيارية يتم تمريرها
  String? labelText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, // تمرير الدالة مباشرة إلى onPressed
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 145, 12, 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      child: Text(
        labelText!,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
