import 'package:flutter/material.dart';

class InquiryInsertTitle extends StatelessWidget {
  const InquiryInsertTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "제목*",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "제목을 적어주세요!",
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
