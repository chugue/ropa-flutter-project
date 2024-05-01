import 'package:final_project_team02/ui/holder/cart/components/cart_page_body_account.dart';
import 'package:final_project_team02/ui/holder/cart/components/cart_page_body_choice_button.dart';
import 'package:final_project_team02/ui/holder/cart/components/cart_page_body_custom_box.dart';
import 'package:final_project_team02/ui/holder/cart/components/cart_page_body_item_card.dart';
import 'package:final_project_team02/ui/holder/cart/components/cart_page_body_title.dart';
import 'package:flutter/material.dart';

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
