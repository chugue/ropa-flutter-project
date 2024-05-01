import 'package:final_project_team02/_core/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            Text(
              "총 상품금액",
              style: textTheme().displayLarge,
            ),
            Text("352,000원", style: textTheme().displayLarge),
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
            Text("352,000원", style: textTheme().displayLarge),
          ],
        ),
      ],
    );
  }
}
