import 'package:final_project_team02/holder/my_page/user/components/apply/user_my_page_apply_modal_body_Custom_form_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserMyPageApplyModalBodyFormTextField extends StatelessWidget {
  final String title;
  final String hinText;
  final String physical;
  final controller;

  const UserMyPageApplyModalBodyFormTextField({
    required this.title,
    required this.hinText,
    required this.physical,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "${title}: ",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Container(
          width: 150,
          height: 50,
          child: UserMyPageApplyModalBodyCustomTextField(
            hinText: "${hinText} 입력해주세요.",
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '값을 입력해주세요';
              }
              final number = double.tryParse(value);
              if (number == null) {
                return '숫자만 입력해주세요';
              }
              // 여기서 추가적인 유효성 검사를 할 수 있습니다. 예: 범위 검사
              return null; // 입력 값이 유효할 경우 null을 반환
            },
          ),
        ),
        Text(
          "${physical}",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
