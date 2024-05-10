import 'package:final_project_team02/ui/holder/inquiry/inquiry_insert_page/components/inquiry_insert_button.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_list_page/components/inquiry_item_view.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_list_page/inquiries_list_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InquiryBody extends ConsumerWidget {
  const InquiryBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    InquiriesListModel? model = ref.watch(inquiriesListProvider);
    return Stack(
      children: [
        InquiryItemView(),
        InquiryInsertButton(),
      ],
    );
  }
}
