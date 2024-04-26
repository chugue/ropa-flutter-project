import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserApplyButton extends StatelessWidget {
  const UserApplyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 66,
        left: 10,
        right: 10,
        child: Container(
          width: 350,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: () {},
            child: Text(
              "지원하기",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ));
  }
}
