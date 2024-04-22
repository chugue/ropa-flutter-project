import 'package:final_project_team02/holder/login/login_page.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';
import '../../validate.dart';

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
      body: Stack(
        children: [
          SafeArea(
              child: Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 10,
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    // get started form
                    child: Form(
                      key: _formSignupKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // get started text

                          SizedBox(height: 40.0),
                          // full name

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

                          //닉네임
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
              ),
            ],
          )),
        ],
      ),
    );
  }

  SizedBox buildJoinButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formSignupKey.currentState!.validate() && agreePersonalData) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('회원가입을 완료하고 있습니다.'),
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

// 커스텀 폼 필드
class CustomFormField extends StatelessWidget {
  final text;
  final controller;
  final obscureText;
  final validator;

  const CustomFormField({
    required this.text,
    required this.controller,
    this.obscureText = false,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      obscuringCharacter: '*',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '${text}를 입력해주세요';
        }
        return null;
      },
      decoration: InputDecoration(
        label: Text("${text}"),
        hintText: '${text}',
        hintStyle: const TextStyle(
          color: Colors.black26,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12, // Default border color
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12, // Default border color
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
