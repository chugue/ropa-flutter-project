import 'package:final_project_team02/_core/constants/theme.dart';
import 'package:final_project_team02/_core/uitls/format_util.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/cart/cart_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPageBodyAccount extends ConsumerWidget {
  final CartModel? model;

  const CartPageBodyAccount({
    required this.model,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cartProvider);
    String orderPrice = formatCurrency(model!.totalCheckedPrice);
    String totalOrderPrice = formatCurrency(model!.cart.totalCartPrice);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "총 ",
              style: textTheme().displayLarge,
            ),
            Text("${totalOrderPrice}",
                style: textTheme().displayLarge),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("총 배송비", style: textTheme().bodyMedium),
            Text("0원", style: textTheme().bodyMedium),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("결제예정금액", style: textTheme().displayLarge),
            Text("${orderPrice}",
                style: textTheme().displayLarge),
          ],
        ),
      ],
    );
  }
}
