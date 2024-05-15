import 'package:final_project_team02/ui/holder/my_page/pages/order/order_history_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'order_history_page_body_exchange_return_tab_view.dart';
import 'order_history_page_body_order_tab_view.dart';
import 'order_history_page_body_tab_bar.dart';
import 'order_history_page_body_title.dart';

class OrderHistoryPageBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    OrderHistoryModel? model = ref.watch(orderHistoryProvider);
    print('⭐⭐⭐⭐⭐⭐${model.toString()}');
    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Container(
          decoration: _buildBoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(height: 10),

                        //밑줄
                        Container(width: 50, height: 3, color: Colors.grey),
                        SizedBox(height: 15),

                        //타이틀
                        OrderPageBodyTitle(title: "주문내역"),
                        SizedBox(height: 20),
                        Divider(),
                      ],
                    ),
                  )
                ];
              },
              body: Column(
                children: [
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          OrderHistioryPageBodyTabBar(),
                          SizedBox(height: 20),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Expanded(
                                    child: OrderHistoryPageBodyOrderTabView(
                                        model: model)),
                                OrderHistoryPageBodyExchangeReturnTabView()
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
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
