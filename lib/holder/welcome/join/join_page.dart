
import 'package:final_project_team02/holder/welcome/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/Logo.dart';
import '../../../components/custom_form_field.dart';
import '../../../theme.dart';
import '../../../validate.dart';


class joinPage extends StatefulWidget {
  const joinPage({super.key});

  @override
  State<joinPage> createState() => _joinPageState();
}

class _joinPageState extends State<joinPage> {
  final _formSignupKey = GlobalKey<FormState>();
  final email = TextEditingController(); // 값을 분석
  final password = TextEditingController(); // 값을 분석
  final nickName = TextEditingController(); // 값을 분석

  bool agreePersonalData = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Logo(width: 250, height: 250),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                key: _formSignupKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40.0),

                    // 이메일 폼 필드
                    CustomFormField(
                      text: 'Email',
                      controller: email,
                      validator: validatePassword(),
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
                      validator: validatePassword(),
                    ),
                    SizedBox(height: 25.0),

                    //개인정보처리 동의(필수)
                    buildProcessingInformation(),
                    const SizedBox(height: 25.0),

                    // 회원가입 버튼
                    buildJoinButton(context),
                    SizedBox(height: 30.0),

                    // '가입하신 적이 있나요?' 문구
                    _buildSignUpCheck(context),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
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
                builder: (e) => const Loginpage(),
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
