import 'package:final_project_team02/ui/holder/inquiry/inquiry_page/inquiry_page.dart';
import 'package:flutter/material.dart';

class InquiryButton extends StatelessWidget {
  const InquiryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InquiryPage(),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "1대1 문의하기",
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
