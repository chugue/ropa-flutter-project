import 'package:final_project_team02/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Icon(CupertinoIcons.chevron_left),
          toolbarHeight: 45,
        ),
        body: ListView(
          children: [
            _pageTitle(),
            ProfileTab(),
          ],
        ), // 예를 들어, 주소 결과를 출력
      ),
    );
  }
}

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: 500,
      child: Column(
        children: [
          _buildTabBar(),
          Expanded(child: _buildTabBarView()),
        ],
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
      indicator: BoxDecoration(
        color: Colors.white,
      ),
      controller: _tabController,
      tabs: [
        Tab(
          child: Container(
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Tab(
          text: "직접 입력",
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

Widget _pageTitle() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "배송지",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87),
          ),
        ),
      ],
    ),
  );
}
