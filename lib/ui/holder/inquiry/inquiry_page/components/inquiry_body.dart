import 'package:final_project_team02/ui/holder/inquiry/inquiry_page/components/inquiry_item_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'inquiry_insert_button.dart';

class InquiryBody extends StatelessWidget {
  const InquiryBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InquiryItemView(),
        InquiryInsertButton(),
      ],
    );
  }
}
