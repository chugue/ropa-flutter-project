import 'package:flutter/material.dart';

// 커스텀 폼 필드
class UserMyPageApplyFormField extends StatelessWidget {
  final controller;
  final obscureText;
  final validator;
  final hintext;

  const UserMyPageApplyFormField({
    required this.hintext,
    required this.controller,
    this.obscureText = false,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: TextInputType.number,
      obscuringCharacter: '*',
      validator: validator,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        hintText: '${hintext} 입력하세요.',
        hintStyle: const TextStyle(
          color: Colors.black26,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
        ),
        errorBorder: UnderlineInputBorder(
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
