import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserMyPageApplyButton extends StatelessWidget {
  const UserMyPageApplyButton({
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
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text('저녁'),
                  content: Text('밥 먹을러 갈래?'),
                  actions: [
                    ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(), child: Text('가자')),
                    ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(), child: Text('싫어')),
                  ],
                  elevation: 10.0,
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                ),
              );
            },
            child: Text(
              "지원하기",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ));
  }
}
