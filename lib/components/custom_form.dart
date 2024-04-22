import 'package:flutter/material.dart';

import '../size.dart';
import '../validate.dart';
import 'custom_form_field.dart';

class CustomForm extends StatelessWidget {
  final email = TextEditingController(); // 값을 분석
  final password = TextEditingController(); // 값을 분석
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: email,
            text: "Email",
            validator: (value) {
              print("value : ${value}");

              if (value!.isEmpty) {
                return "비어있을수 없습니다";
              } else {
                return null; // 정상일때 null을 리턴한다.
              }
            },
          ),
          SizedBox(height: mediumGap),
          CustomTextFormField(
            controller: password,
            text: "password",
            validator: validatePassword(),
          ),
          SizedBox(height: largeGap),
          TextButton(
            onPressed: () {
              //print("email: ${email.text}");
              if (formkey.currentState!.validate()) {
                Navigator.pushNamed(context, "/home");
                // validator를 호출
                print("유효성 통과 ===================");
              }
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
