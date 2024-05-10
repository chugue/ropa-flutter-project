import 'package:final_project_team02/ui/holder/main_holder.dart';
import 'package:flutter/material.dart';

import 'components/inquiry_body.dart';

class InquiryPage extends StatelessWidget {
  const InquiryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "1대1 문의내역",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainHolder()),
              );
            },
            icon: Icon(Icons.home_filled),
          )
        ],
      ),
      body: InquiryBody(),
    );
  }
}
