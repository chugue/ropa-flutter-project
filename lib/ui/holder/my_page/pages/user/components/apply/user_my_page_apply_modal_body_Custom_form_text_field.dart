import 'package:flutter/material.dart';

// 커스텀 폼 필드
class UserMyPageApplyModalBodyCustomTextField extends StatelessWidget {
  final controller;
  final obscureText;
  final validator;
  final hinText;
  final keyType;

  const UserMyPageApplyModalBodyCustomTextField({
    required this.controller,
    required this.keyType,
    this.obscureText = false,
    required this.hinText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyType,
      obscuringCharacter: '*',
      validator: validator,
      decoration: InputDecoration(
        hintText: hinText,
        border: UnderlineInputBorder(),
        hintStyle: const TextStyle(
          color: Colors.black26,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
        ),
        errorBorder: UnderlineInputBorder(),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
