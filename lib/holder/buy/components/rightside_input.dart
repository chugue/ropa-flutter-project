import 'package:flutter/cupertino.dart';

import 'address_search.dart';
import 'email_field.dart';
import 'mobile_input.dart';
import 'text_form.dart';

class RightSideInput extends StatelessWidget {
  const RightSideInput({
    super.key,
    required GlobalKey<FormState> formkey,
  }) : _formkey = formkey;

  final GlobalKey<FormState> _formkey;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
