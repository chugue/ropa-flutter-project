import 'package:final_project_team02/data/domain_data/inquiry.dart';
import 'package:flutter/material.dart';

class InquiryBrand extends StatelessWidget {
  const InquiryBrand({
    super.key,
    required this.inquiry,
  });

  final InquiryItem inquiry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 60.0,
            height: 60.0,
            child: Image.network(inquiry.brand.logo),
          ),
          SizedBox(width: 10),
          Text(
            inquiry.brand.name,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
