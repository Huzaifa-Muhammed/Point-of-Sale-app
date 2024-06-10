import 'package:flutter/material.dart';
import '../../Utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String? errorText;
  final TextInputType? keyboardType;

  CustomTextField({
    required this.labelText,
    required this.controller,
    this.errorText,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            fontSize: 16,
            color: primaryColor, // Replace with your primary color
          ),
          errorText: errorText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: errorText != null ? Colors.red : Colors.grey),
          ),
        ),
      ),
    );
  }
}
