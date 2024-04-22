import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final text;
  final controller;
  final obscureText;
  final validator;

  const CustomTextFormField({
    required this.text,
    required this.controller,
    this.obscureText = false,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("${text}"),
        TextFormField(
          obscureText: obscureText,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            hintText: "Enter ${text}",
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            errorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            focusedErrorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
        )
      ],
    );
  }
}
