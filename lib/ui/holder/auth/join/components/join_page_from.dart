import 'package:final_project_team02/_core/constants/theme.dart';
import 'package:final_project_team02/_core/uitls/validator_util.dart';
import 'package:final_project_team02/data/dtos/user_req.dart';
import 'package:final_project_team02/ui/components/custom_form_field.dart';
import 'package:final_project_team02/ui/holder/auth/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../data/dtos/user_req.dart';
import '../../../../../data/session_data/session_data.dart';

class JoinFrom extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _nickName = TextEditingController();

  bool agreePersonalData = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.0),

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

          //닉네임 폼 필드
          CustomFormField(
            text: 'NickName',
            controller: _nickName,
            validator: validateNickName(),
          ),
          SizedBox(height: 25.0),

          // //개인정보처리 동의(필수)
          // buildProcessingInformation(),
          // const SizedBox(height: 25.0),

          // 회원가입 버튼
          ElevatedButton(
            onPressed: () {
              bool isOk = _formKey.currentState!.validate();
              if (isOk) {
                String nickName = _nickName.text.trim();
                String password = _password.text.trim();
                String email = _email.text.trim();
                print(
                    "nickName: ${nickName} password: ${password} email: ${email}");

                JoinReqDTO joinReqDTO = JoinReqDTO(
                  nickName: nickName,
                  password: password,
                  email: email,
                );
                print("joinReqDTO: ${joinReqDTO.toJson()}");
                SessionData s = ref.read(sessionProvider);

                s.join(joinReqDTO);
              }
            },
            child: Text('회원가입'),
          ),
          SizedBox(height: 30.0),

          // '가입하신 적이 있나요?' 문구
          _buildSignUpCheck(context),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  // '가입하신 적이 있나요?' 문구
  Widget _buildSignUpCheck(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '가입하신 적이 있나요? ',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (e) => const LoginPage(),
              ),
            );
          },
          child: Text(
            '로그인',
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
