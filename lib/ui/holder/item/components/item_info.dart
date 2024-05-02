import 'package:flutter/material.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _itemMainImg(context),
        _itemBrand(),
        _itemPrice(),
        _itemName(),
      ],
    );
  }

  Padding _itemName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        "반팔티",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Column _itemPrice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0) /* 패딩 왼위오밑 */,
          child: Row(
            children: [
              Text(
                "20%",
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
              SizedBox(width: 8),
              Text(
                "40,000원",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "50,000원",
            style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough),
          ),
        ),
      ],
    );
  }

  Padding _itemBrand() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              "assets/images/ropa_home_logo.png",
              width: 50,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _itemMainImg(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Image.asset("assets/images/item/item_01.png"),
          // TODO: 아이템 더미 만들기.
        ],
      ),
    );
  }
}
