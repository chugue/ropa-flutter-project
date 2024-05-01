import 'package:flutter/material.dart';

import 'components/order_history_page_body.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({
    required this.orderId,
  });

  final int orderId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {

            return OrderHistoryPageBody();

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
          // isDismissible: true,

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("주문조회", style: TextStyle(color: Colors.black26, fontSize: 25)),
          Text("${orderId}",
              style: TextStyle(color: Colors.black, fontSize: 20)),
        ],
      ),
    );
  }
}
