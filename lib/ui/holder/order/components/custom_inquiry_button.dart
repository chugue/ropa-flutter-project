


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInquiryButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text("1:1 문의 하기",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black)),
        ),
      ),
    );
  }
}
