import 'package:flutter/material.dart';

import 'order_history_page_body_exchange_return_tab_view.dart';
import 'order_history_page_body_order_tab_view.dart';
import 'order_history_page_body_tab_bar.dart';
import 'order_history_page_body_title.dart';

class OrderHistoryPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    Container(width: 50, height: 3, color: Colors.grey),
                    SizedBox(height: 15),
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
                            OrderHistoryPageBodyOrderTabView(),
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
