import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool obscureText;
  final String labelText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;

  const CommonTextField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: textEditingController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: prefixIcon,
      ),
    );
  }
}
