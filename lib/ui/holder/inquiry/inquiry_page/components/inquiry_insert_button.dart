import 'package:final_project_team02/ui/holder/inquiry/inquiry_insert_page/InquiryInsertPage.dart';
import 'package:flutter/material.dart';

class InquiryInsertButton extends StatelessWidget {
  const InquiryInsertButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => InquiryInsertPage()));
          },
          child: Text(
            "1대1 문의하기",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
