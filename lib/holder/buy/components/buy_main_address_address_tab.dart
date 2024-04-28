import 'package:flutter/material.dart';

import 'choose_address.dart';
import 'input_address.dart';

class BuyMainAddressAddressTab extends StatefulWidget {
  const BuyMainAddressAddressTab({Key? key}) : super(key: key);

  @override
  State<BuyMainAddressAddressTab> createState() =>
      _BuyMainAddressAddressTabState();
}

class _BuyMainAddressAddressTabState extends State<BuyMainAddressAddressTab>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: 480,
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            _buildTabBar(),
            Expanded(child: _buildTabBarView()),
          ],
        ),
      ),
    );
  }

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 1);
  }

  Widget _buildTabBar() {
    return TabBar(
      labelPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.black12, width: 0.5),
          left: BorderSide(color: Colors.black12, width: 0.5),
          right: BorderSide(color: Colors.black12, width: 0.5),
        ),
      ),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black38,
      controller: _tabController,
      tabs: [
        Tab(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Text(
                "최근 배송지",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Tab(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Text(
                "직접입력",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        Container(
          color: Colors.white,
        ),
        Container(
          color: Colors.white,
          child: Column(
            children: [
              ChooseAddress(),
              InputAddress(),
              SizedBox(height: 10),
              Divider(color: Colors.black12),
            ],
          ),
        ),
      ],
    );
  }
}
