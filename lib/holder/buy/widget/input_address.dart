import 'package:final_project_team02/holder/buy/widget/rightside_input.dart';
import 'package:flutter/material.dart';

import 'leftside_title.dart';

class InputAddress extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          children: [
            LeftSideTitle(),
            RightSideInput(formkey: _formkey),
          ],
        ),
      ),
    );
  }
}
