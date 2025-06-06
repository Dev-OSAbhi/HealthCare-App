import 'package:flutter/material.dart';

class EmailInputField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  const EmailInputField({
    super.key,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your email";
        }
        final emailRegex = RegExp(
          r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
        );
        if (!emailRegex.hasMatch(value)) {
          return "Enter a valid email";
        }
        return null;
      },
    );
  }
}
