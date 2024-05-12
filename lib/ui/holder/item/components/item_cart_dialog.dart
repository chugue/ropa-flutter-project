import 'package:final_project_team02/ui/holder/item/components/item_buy_button.dart';
import 'package:final_project_team02/ui/holder/item/components/item_cart_move_page.dart';
import 'package:flutter/material.dart';

class ItemCartDialog extends StatelessWidget {
  const ItemCartDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      //Dialog Main Title
      title: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 16, color: Colors.black),
          children: <TextSpan>[
            TextSpan(text: '제품', style: TextStyle(color: Colors.blue)),
            TextSpan(text: '을 장바구니에 담았습니다.\n'),
            TextSpan(text: '장바구니로 이동 하시겠습니까?'),
          ],
        ),
      ),
      actions: [
        ItemCartMovePage(),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("취소"),
        )
      ],
    );
  }
}
