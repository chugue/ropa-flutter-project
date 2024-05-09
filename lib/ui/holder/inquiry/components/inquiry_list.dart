import 'package:final_project_team02/data/global_data/inquiry.dart';
import 'package:flutter/material.dart';

// 📢stf로 관리하겠습니다.
class InquiryListView extends StatefulWidget {
  const InquiryListView({super.key});

  @override
  State<InquiryListView> createState() => _InquiryListState();
}

class _InquiryListState extends State<InquiryListView> {
  final List<InquiryItem> _something =
      generateItems(inquiryList.length).cast<InquiryItem>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        // expansionCallback에서 isOpen 삭제
        expansionCallback: (int inquiryListIndex, bool isOpen) {
          setState(() {
            // 수정된 부분은 이전의 isOpen를 삭제합니다.
          });
        },
        // animationDuration: Duration(seconds: 2),
        // dividerColor: Colors.red,
        // elevation: 1,
        // expandedHeaderPadding: EdgeInsets.all(8),
        children: [
          ExpansionPanel(
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) {
              return ListTile(
                title: Text(
                  inquiryList[1].title,
                ),
                subtitle: Text(inquiryList[1].state),
              );
            },
            body: ListTile(
              title: Text(
                "문의 내용:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(inquiryList[1].content),
              // SizedBox(height: 8),
              // Text(
              //   "문의 날짜: ${inquiryList[1].createdAt}",
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   "답변 상태: ${inquiryList[1].status}",
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
            ),
          ),
        ],
      ),
    );
    ;
  }

  static generateItems(int length) {}
}
