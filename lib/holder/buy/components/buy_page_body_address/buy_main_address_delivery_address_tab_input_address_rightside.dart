import 'package:flutter/cupertino.dart';

import 'buy_main_address_delivery_address_tab_input_address_leftside_text_form.dart';
import 'buy_main_address_delivery_address_tab_input_address_rightside_address_search.dart';
import 'buy_main_address_delivery_address_tab_input_address_rightside_email_field.dart';
import 'buy_main_address_delivery_address_tab_input_address_rightside_mobile_input.dart';

class RightSide extends StatelessWidget {
  const RightSide({
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
