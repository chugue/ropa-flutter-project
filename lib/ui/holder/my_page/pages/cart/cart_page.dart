import 'package:flutter/material.dart';

import 'components/cart_page_body.dart';

class CartPage extends StatelessWidget {
  final cartIcon;

  const CartPage({
    required this.cartIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Icon(cartIcon),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            //바디
            return CartPageBody();
          },

          //바텀 모양
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),

          /// 바텀시트 드래그 가능 여부
          enableDrag: true,

          /// 바텀시트가 아닌 부분을 클릭했을 때 닫기
          isDismissible: true,

          /// 사이즈 조절
          constraints: const BoxConstraints(
              // maxWidth: double.infinity,
              // maxHeight: 1000,
              ),

          isScrollControlled: true,

          /// 바텀시트 배경 컬러
          backgroundColor: Colors.transparent,
          useSafeArea: true,
        );
      },
    );
  }
}
