import 'package:final_project_team02/ui/holder/my_page/pages/cart/cart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart_page_body_item_card_delete.dart';
import 'cart_page_body_item_card_detail.dart';
import 'cart_page_body_item_card_order.dart';

class CartPageBodyItemCard extends ConsumerWidget {
  final CartModel? model;

  const CartPageBodyItemCard({
    required this.model,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (model == null) return Align(child: CircularProgressIndicator());

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: model!.cartList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: model!.isChecked[index],
                          onChanged: (bool? newValue) {
                            ref.read(cartProvider.notifier).toggleItem(index);
                          },
                          shape: RoundedRectangleBorder(
                              // 사각형 모양에 둥근 모서리 적용
                              borderRadius: BorderRadius.circular(4)),
                          side: BorderSide(color: Colors.black, width: 2),
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith((states) {
                            return states.contains(MaterialState.selected)
                                ? Colors.black
                                : Colors.transparent;
                          }),
                        ),

                        //카드 상세
                        CartPageBodyItemCardDetail(model: model!, index: index),

                        Divider(),
                        SizedBox(width: 20),

                        Text("[옵션 : free ]"),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //아이템 카드 삭제
                            CartPageBodyItemCardDelete(
                              cartId: model!.cartList[index].cartId,
                            ),

                            //아이템 카드 주문하기
                            CartPageBodyItemCardOrder()
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
