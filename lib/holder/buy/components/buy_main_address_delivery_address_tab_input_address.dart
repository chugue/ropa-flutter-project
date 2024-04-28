import 'package:final_project_team02/holder/buy/components/buy_main_address_delivery_address_tab_input_address_rightside.dart';
import 'package:flutter/material.dart';

import 'buy_main_address_delivery_address_tab_input_address_leftside.dart';

class InputAddress extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          children: [
            LeftSide(),
            RightSide(formkey: _formkey),
          ],
        ),
      ),
    );
  }
}
