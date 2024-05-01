import 'package:flutter/cupertino.dart';

import 'buy_address_tab_bar_view_input_address_search.dart';
import 'buy_address_tab_bar_view_input_email.dart';
import 'buy_address_tab_bar_view_input_phone_number.dart';
import 'buy_address_tab_bar_view_input_text_form.dart';

class BuyAddressTabBarViewInputRightSide extends StatelessWidget {
  const BuyAddressTabBarViewInputRightSide({
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
            BuyAddressTabBarViewInputTextForm(text: "이름"),
            SizedBox(height: 15),
            BuyAddressTabBarViewInputAddressSearch(),
            SizedBox(height: 15),
            BuyAddressTabBarViewInputTextForm(text: "기본주소"),
            SizedBox(height: 15),
            BuyAddressTabBarViewInputTextForm(text: "나머지 주소 (선택 입력 가능)"),
            SizedBox(height: 15),
            BuyAddressTabBarViewInputPhoneNumber(),
            SizedBox(height: 15),
            BuyAddressTabBarViewInputEmail(),
          ],
        ),
      ),
    );
  }
}
