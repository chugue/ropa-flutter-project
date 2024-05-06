import 'package:final_project_team02/_core/constants/move.dart';
import 'package:final_project_team02/_core/constants/theme.dart';
import 'package:final_project_team02/_core/uitls/validator_util.dart';
import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../data/dtos/user_request.dart';
import '../../../../components/custom_form_field.dart';

class LoginFrom extends ConsumerWidget {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool rememberPassword = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40.0),

          // 이메일 폼 필드
          CustomFormField(
            text: 'Email',
            controller: _email,
            validator: validateEmail(),
          ),
          const SizedBox(height: 25.0),

          // 패스워드 폼 필드
          CustomFormField(
            text: 'Password',
            controller: _password,
            validator: validatePassword(),
          ),
          const SizedBox(height: 25.0),

          //로그인 완료 후 얼러트
          ElevatedButton(
            onPressed: () {
              bool isOk = _formKey.currentState!.validate();

              if (isOk) {
                String email = _email.text.trim();
                String password = _password.text.trim();

                print("email: ${email}, pw: ${password}");
                LoginReqDTO loginReqDTO =
                    LoginReqDTO(email: email, password: password);

                print("LoginReqDTO: ${loginReqDTO.toJson()}");

                SessionData s = ref.read(sessionProvider);

                s.login(loginReqDTO);
              }
            },
            child: const Text('로그인'),
          ),
          const SizedBox(height: 25.0),

          Divider(thickness: 0.7, color: Colors.grey),

          const SizedBox(height: 25.0),

          // 가입하신 적이 없나요? 문구       // don't have an account
          buildJoinButton(context),
        ],
      ),
    );
  }

  Widget buildJoinButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '가입하신 적이 없나요? ',
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.popAndPushNamed(
              context,
              Move.joinPage,
            );
          },
          child: Text(
            '회원가입',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: lightColorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildFindPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberPassword,
              onChanged: (bool? value) {},
              activeColor: lightColorScheme.primary,
            ),
            const Text(
              '기억하기',
              style: TextStyle(
                color: Colors.black45,
              ),
            ),
          ],
        ),
        GestureDetector(
          child: Text(
            '비밀번호 찾기',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: lightColorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
