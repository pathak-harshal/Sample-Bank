import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool obscureText;
  final String labelText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final bool isToAutoCorrect;

  const CommonTextField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.isToAutoCorrect = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      autocorrect: isToAutoCorrect,
      controller: textEditingController,
      obscureText: obscureText,
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
