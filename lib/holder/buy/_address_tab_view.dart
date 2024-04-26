import 'package:flutter/material.dart';

import '_choose_address.dart';
import '_input_address.dart';

class AddressTab extends StatefulWidget {
  const AddressTab({Key? key}) : super(key: key);

  @override
  State<AddressTab> createState() => _AddressTabState();
}

class _AddressTabState extends State<AddressTab>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: 500,
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
    _tabController = new TabController(length: 2, vsync: this);
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
              Container(),
              Container(),
              Container(),
              Container(),
              Container(),
            ],
          ),
        ),
      ],
    );
  }
}
