import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        border: Border.all(
          color: Colors.black12,
          width: 0.5,
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
                "직접 입력",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
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
        Container(color: Colors.green),
        Container(color: Colors.red),
      ],
    );
  }
}
