import 'package:flutter/material.dart';

import '_address_search.dart';
import '_mobile_input.dart';
import '_small_title.dart';
import '_text_form.dart';

class InputAddress extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: 20),
                  SmallTitle(text: "받는사람"),
                  SizedBox(height: 50),
                  SmallTitle(text: "주소"),
                  SizedBox(height: 130),
                  SmallTitle(text: "휴대전화"),
                  SizedBox(height: 40),
                  SmallTitle(text: "이메일"),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextForm(text: "이름"),
                    SizedBox(height: 15),
                    AddressSearch(),
                    SizedBox(height: 15),
                    TextForm(text: "기본주소"),
                    SizedBox(height: 15),
                    TextForm(text: "나머지 주소 (선택 입력 가능)"),
                    SizedBox(height: 15),
                    MobileInput(),
                    SizedBox(height: 15),
                    EmailField(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 100,
          child: TextFormField(
            maxLines: 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black26,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          child: Center(
              child: Text(
            " @ ",
            style: TextStyle(fontSize: 15, color: Colors.black87),
          )),
        )
      ],
    );
  }
}
