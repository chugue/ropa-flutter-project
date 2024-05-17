import 'package:final_project_team02/ui/holder/my_page/pages/user/user_my_pageviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/order_history_page_body.dart';

class OrderHistoryPage extends ConsumerWidget {
  const OrderHistoryPage({
    required this.orderCount,
  });

  final int orderCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserMyPageModel? model = ref.watch(userMyPageProvider);
    return Expanded(
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              //바디
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("주문조회", style: TextStyle(color: Colors.black26, fontSize: 25)),
            Text("${orderCount}",
                style: TextStyle(color: Colors.black, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
