import 'package:final_project_team02/holder/welcome/login/login_page.dart';
import 'package:flutter/material.dart';

import '../../../../_core/constants/theme.dart';
import '../../../../_core/uitls/validator_util.dart';
import '../../../../components/custom_form_field.dart';



class JoinPageFrom extends StatefulWidget {

  @override
  State<JoinPageFrom> createState() => _JoinPageFromFieldState();
}

class _JoinPageFromFieldState extends State<JoinPageFrom> {
  final _formSignupKey = GlobalKey<FormState>();

  final email = TextEditingController();
  // 값을 분석
  final password = TextEditingController();
  // 값을 분석
  final nickName = TextEditingController();
  // 값을 분석
  bool agreePersonalData = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formSignupKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.0),

          // 이메일 폼 필드
          CustomFormField(
            text: 'Email',
            controller: email,
            validator: validateEmail(),
          ),
          const SizedBox(height: 25.0),

          // 패스워드 폼 필드
          CustomFormField(
            text: 'Password',
            controller: password,
            validator: validatePassword(),
          ),
          const SizedBox(height: 25.0),

          //닉네임 폼 필드
          CustomFormField(
            text: 'NickName',
            controller: nickName,
            validator: validateNickName(),
          ),
          SizedBox(height: 25.0),

          // //개인정보처리 동의(필수)
          // buildProcessingInformation(),
          // const SizedBox(height: 25.0),

          // 회원가입 버튼
          buildJoinButton(context),
          SizedBox(height: 30.0),

          // '가입하신 적이 있나요?' 문구
          _buildSignUpCheck(context),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  //개인정보처리 동의(필수)
  Widget buildProcessingInformation() {
    return Row(
      children: [
        Checkbox(
          value: agreePersonalData,
          onChanged: (bool? value) {
            setState(() {
              agreePersonalData = value!;
            });
          },
          activeColor: lightColorScheme.primary,
        ),
        const Text(
          '개인정보 처리에 동의합니다.',
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
        Text(
          '(필수)',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: lightColorScheme.primary,
          ),
        ),
      ],
    );
  }

  // 회원가입 버튼
  Widget buildJoinButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formSignupKey.currentState!.validate() && agreePersonalData) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('회원가입 신청을 완료하고 있습니다.'),
              ),
            );
          } else if (!agreePersonalData) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('개인정보 처리에 동의해주시길 바랍니다.')),
            );
          }
        },
        child: Text('회원가입 완료'),
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
            color: Colors.black45,
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