import 'package:flutter/material.dart';

import '../../../components/Logo.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_form_field.dart';
import '../../../theme.dart';
import '../../../validate.dart';
import '../join/join_page.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _SignInPageState();
}

class _SignInPageState extends State<Loginpage> {
  final email = TextEditingController(); // 값을 분석
  final password = TextEditingController(); // 값을 분석
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(miconRight: Icons.home, miconLeft: Icons.settings),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Logo(width: 250, height: 250),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                key: _formSignInKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40.0),

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

                    // //비밀번호 찾기
                    // buildFindPassword(),
                    // const SizedBox(height: 25.0),

                    // //로그인 완료 후 얼러트
                    // buildLoginFinishAllert(context),
                    // const SizedBox(height: 25.0),

                    Divider(thickness: 0.7, color: Colors.grey),

                    const SizedBox(height: 25.0),

                    // 가입하신 적이 없나요? 문구       // don't have an account
                    buildJoinButton(context),
                  ],
                ),
              ),
            ),
          ),
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (e) => const joinPage(),
              ),
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

  Widget buildLoginFinishAllert(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formSignInKey.currentState!.validate() && rememberPassword) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('로그인중입니다.'),
              ),
            );
          }
        },
        child: const Text('로그인'),
      ),
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
              onChanged: (bool? value) {
                setState(() {
                  rememberPassword = value!;
                });
              },
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
