import 'package:flutter/material.dart';

class InquiryInsertContent extends StatelessWidget {
  const InquiryInsertContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "설명*",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        TextField(
          maxLines: 5,
          decoration: InputDecoration(
            hintText: "내용을 적어주세요!",
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
