import 'package:final_project_team02/ui/holder/my_page/pages/user/components/apply/user_my_page_apply_modal_body_Custom_form_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserMyPageApplyModalBodyFormTextField extends StatelessWidget {
  final String title;
  final String hinText;
  final String physical;
  final controller;
  final validator;
  final keyType;

  const UserMyPageApplyModalBodyFormTextField({
    required this.title,
    required this.hinText,
    required this.physical,
    required this.controller,
    required this.validator,
    required this.keyType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 70,
          child: Text(
            "${title}: ",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: 150,
          height: 50,
          child: UserMyPageApplyModalBodyCustomTextField(
            keyType: keyType,
            hinText: "${hinText} 입력해주세요.",
            controller: controller,
            validator: validator,
          ),
        ),
        Text(
          "${physical}",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
