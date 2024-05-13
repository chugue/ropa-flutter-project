import 'package:final_project_team02/_core/constants/theme.dart';
import 'package:final_project_team02/_core/uitls/format_util.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/cart/cart_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPageBodyAccount extends ConsumerWidget {
  final CartModel model;

  const CartPageBodyAccount({
    required this.model,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cartProvider);
    String orderPrice = formatCurrency(model.totalCheckedPrice);
    // 로직이 총 금액 + 배송비 = 총 결제금액이라, 현재 배송비 0원이면 총금액 + 결제금액 로직 같음.
    String totalOrderPrice = formatCurrency(model.cart.totalCartPrice);

    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       "장바구니 금액",
        //       style: textTheme().displayLarge,
        //     ),
        //     Text("${totalOrderPrice}", style: textTheme().displayLarge),
        //   ],
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("총 배송비", style: textTheme().bodyMedium),
            Text("0원", style: textTheme().bodyMedium),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("결제예정금액", style: textTheme().displayLarge),
            Text("${orderPrice}", style: textTheme().displayLarge),
          ],
        ),
      ],
    );
  }
}
