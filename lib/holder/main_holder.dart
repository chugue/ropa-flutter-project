import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

class MainHolder extends StatelessWidget {
  const MainHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Icon(CupertinoIcons.chevron_left),
          toolbarHeight: 45,
        ),
        body: ListView(
          children: [
            Container(
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
                        color: Colors.black87
                      ),
                    ),
                  ),
                  TabBar(),
                ],
              ),
            ),
          ],
        ), // 예를 들어, 주소 결과를 출력
      ),
    );
  }
}

class TabBar extends StatefulWidget {
  const TabBar({
    super.key,
  });

  @override
  State<TabBar> createState() => _TabBarState();
}

class _TabBarState extends State<TabBar> with SingleTickerProviderStateMixin{
  TabController? _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
    );
  }
}
