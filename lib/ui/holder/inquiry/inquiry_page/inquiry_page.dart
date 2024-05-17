import 'package:final_project_team02/ui/holder/inquiry/inquiry_page/inquiries_list_viewmodel.dart';
import 'package:final_project_team02/ui/holder/main_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/inquiry_body.dart';

class InquiryPage extends ConsumerWidget {
  const InquiryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    InquiriesListModel? model = ref.watch(inquiriesListProvider);

    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
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
}
