import 'package:final_project_team02/holder/main/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../../_core/constants/theme.dart';
import 'cart_page_body_choice_button.dart';
import 'cart_page_body_custom_box.dart';
import 'cart_page_body_item_card.dart';
import 'cart_page_body_title.dart';

class CartPageBodyAccount extends StatelessWidget {
  const CartPageBodyAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("총 상품금액",style: textTheme().displayLarge,),
            Text("352,000원",style: textTheme().displayLarge),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("총 배송비",style: textTheme().bodyMedium),
            Text("0원",style: textTheme().bodyMedium),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("결제예정금액",style: textTheme().displayLarge),
            Text("352,000원",style: textTheme().displayLarge),
          ],
        ),
      ],
    );
  }
}



