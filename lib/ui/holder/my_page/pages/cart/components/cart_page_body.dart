import 'package:final_project_team02/ui/holder/buy/buy_page.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/cart/cart_viewmodel.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/cart/components/cart_page_body_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart_page_body_account.dart';
import 'cart_page_body_custom_box.dart';
import 'cart_page_body_item_card.dart';

class CartPageBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartModel? model = ref.watch(cartProvider);

    if (model == null) return Align(child: CircularProgressIndicator());
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Container(
        decoration: _buildBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 10),
              //밑줄
              Container(width: 50, height: 3, color: Colors.grey),
              SizedBox(height: 15),

              //타이틀
              CartPageBodyTitle(title: "장바구니"),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),

              //상품 개수
              CartPageCustomBox(text: "일반상품(${model.cartList.length})"),
              SizedBox(height: 20),

              //아이템 카드박스
              Expanded(
                child: CartPageBodyItemCard(model: model),
              ),
              SizedBox(height: 20),

              // CartPageCustomBox(text: "업체기본배송"),
              // SizedBox(height: 20),

              // CartPageBodyChoiceButton(),
              // SizedBox(height: 20),
              // Divider(),

              CartPageBodyAccount(model: model),
              SizedBox(height: 20),
              Divider(),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 50,
                  child: InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BuyPage()));
                    },
                    child: Container(
                      width: 350,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "구매하기",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              )
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
