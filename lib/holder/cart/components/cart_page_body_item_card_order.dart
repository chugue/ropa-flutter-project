import 'package:final_project_team02/holder/main/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../../_core/constants/theme.dart';

class CartPageBodyItemCardOrder extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor:
        MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(
            Colors.grey.shade500),
      ),
      onPressed: () {
        // 버튼 클릭 시 실행할 코드
      },
      child: Text("주문하기"),
    );
  }
}
