import 'package:final_project_team02/holder/main/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../../_core/constants/theme.dart';

class CartPageBodyItemCardDelete extends StatelessWidget {
  const CartPageBodyItemCardDelete({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
              Colors.redAccent),
          backgroundColor:
          MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {},
        child: Text("삭제"));
  }
}
