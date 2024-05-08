import 'package:final_project_team02/data/global_data/inquiry.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_detail_page/InquiryDetailPage.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_page/components/inquiry_content.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_page/components/inquiry_state.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_page/components/inquiry_title_and_content.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InquiryItemView extends StatelessWidget {
  const InquiryItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: inquiryList.length,
      itemBuilder: (context, index) {
        /* DateTime 포맷 */
        String formattedDate =
            DateFormat("yyyy-MM-dd HH:mm").format(inquiryList[index].createdAt);

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        InquiryDetailPage(inquiry: inquiryList[index]),
                  ),
                );
              },
              tileColor: Colors.grey[200],
              title: InquiryState(formattedDate: formattedDate, index: index),
              subtitle: Column(
                children: [
                  InquiryTitle(index: index),
                  InquiryContent(index: index),
                ],
              )),
        );
      },
    );
  }
}
