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

class CartPageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.1),
      child: Container(
        decoration: _buildBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(width: 50, height: 3, color: Colors.grey),
              SizedBox(height: 15),
              CartPageBodyTitle(title: "장바구니"),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              CartPageCustomBox(text: "일반상품"),
              SizedBox(height: 20),
              CartPageBodyItemCard(),
              SizedBox(height: 20),
              CartPageCustomBox(text: "업체기본배송"),
              SizedBox(height: 20),
              CartPageBodyChoiceButton(),
              SizedBox(height: 20),
              CartPageBodyAccount(),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      color: Colors.white,
    );
  }

}

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



