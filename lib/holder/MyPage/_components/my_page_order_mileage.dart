import 'package:flutter/material.dart';

class MyPageOrderMileage extends StatelessWidget {
  final int orderId;
  final int mileageId;

  const MyPageOrderMileage({
    required this.orderId,
    required this.mileageId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("주문조회",
                  style: TextStyle(color: Colors.black26, fontSize: 25)),
              Text("${orderId}",
                  style: TextStyle(color: Colors.black, fontSize: 20)),
            ],
          ),
          Container(width: 2, height: 50, color: Colors.white),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("마일리지",
                  style: TextStyle(color: Colors.black26, fontSize: 25)),
              Text("${mileageId}p",
                  style: TextStyle(color: Colors.black, fontSize: 20)),
            ],
          ),
        ],
      ),
    );
  }
}
