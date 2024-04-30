import 'package:flutter/material.dart';

class BuyPageBodyAddressTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      tabs: [
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
      ],
    );
  }
}
