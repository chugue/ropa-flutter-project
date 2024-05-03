import 'package:expandable/expandable.dart';
import 'package:final_project_team02/models/inquiry.dart';
import 'package:final_project_team02/ui/holder/inquiry/components/inquiry_list.dart';
import 'package:flutter/material.dart';

class InquiryPage extends StatelessWidget {
  const InquiryPage({super.key});

  @override
  Widget build(BuildContext context) {
    ExpandableController expController =
        new ExpandableController(initialExpanded: true);

    final double screenWidth;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.chevron_left,
          size: 30,
        ),
        title: Text(
          "1:1 문의내역",
        ),
        actions: [
          IconButton(
              onPressed: () {
                GestureDetector();
              },
              icon: Icon(Icons.home_filled))
        ],
      ),
      body: ListView.builder(
        itemCount: inquiryList.length,
        itemBuilder: (context, inquiryIndex) {
          return InquiryListItem(inquiry: inquiryList[inquiryIndex]);
        },
      ),
    );
  }
}

class InquiryListItem extends StatelessWidget {
  final InquiryItem inquiry;

  const InquiryListItem({Key? key, required this.inquiry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InquiryListView();
    // return Card(
    //   child: ExpansionTile(
    //     backgroundColor: Color.fromRGBO(0, 0, 0, 0.1),
    //     title: Text(inquiry.title),
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.symmetric(vertical: 8.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               "문의 내용:",
    //               style: TextStyle(fontWeight: FontWeight.bold),
    //             ),
    //             Text(inquiry.content),
    //             SizedBox(height: 8),
    //             Text(
    //               "문의 날짜: ${inquiry.createdAt}",
    //               style: TextStyle(fontWeight: FontWeight.bold),
    //             ),
    //             SizedBox(height: 8),
    //             Text(
    //               "답변 상태: ${inquiry.status}",
    //               style: TextStyle(fontWeight: FontWeight.bold),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    //   // body: SingleChildScrollView(
    //   //   child: Column(
    //   //     children: [
    //   //       Padding(
    //   //         padding: const EdgeInsets.all(8.0),
    //   //         child: ExpandablePanel(
    //   //           controller: expController,
    //   //           header: Row(
    //   //             children: [
    //   //               Text("전체보기 | "),
    //   //               Text(
    //   //                 "전체 시기",
    //   //                 style: TextStyle(color: Colors.black),
    //   //               )
    //   //             ],
    //   //           ),
    //   //           theme: ExpandableThemeData(
    //   //             iconColor: Colors.black,
    //   //             iconPadding: EdgeInsets.symmetric(horizontal: 20),
    //   //             iconSize: 30,
    //   //             headerAlignment:
    //   //                 ExpandablePanelHeaderAlignment.center /* 새로 중앙 */,
    //   //           ),
    //   //           collapsed: SizedBox() /* TODO : 알아보기 */,
    //   //           expanded: Column(
    //   //             children: [
    //   //               DefaultTabController(
    //   //                 length: 2, // 탭바 개수`
    //   //                 child: Column(
    //   //                   crossAxisAlignment: CrossAxisAlignment.start,
    //   //                   children: [
    //   //                     Text(
    //   //                       "처리 상태",
    //   //                       style: TextStyle(
    //   //                         color: Colors.black,
    //   //                         fontWeight: FontWeight.bold,
    //   //                       ),
    //   //                     ),
    //   //                     SizedBox(height: 12),
    //   //                     Container(
    //   //                       width: double.infinity,
    //   //                       color: Colors.blue, // 버튼 바탕색
    //   //                       child: TextButton(
    //   //                         child: Text(
    //   //                           "전체보기",
    //   //                           style: TextStyle(color: Colors.white),
    //   //                         ),
    //   //                         onPressed: () {
    //   //                           // 전체보기 눌렀을 때. 모든 설정 초기화.
    //   //                         },
    //   //                       ),
    //   //                     ),
    //   //                     SizedBox(height: 12),
    //   //                     Row(
    //   //                       children: [
    //   //                         Expanded(
    //   //                           child: Container(
    //   //                             decoration: BoxDecoration(
    //   //                                 border: Border.all(color: Colors.grey)),
    //   //                             child: TextButton(
    //   //                               child: Text(
    //   //                                 "답변대기",
    //   //                                 style: TextStyle(color: Colors.grey),
    //   //                               ),
    //   //                               onPressed: () {
    //   //                                 // 전체보기 눌렀을 때. 모든 설정 초기화.
    //   //                               },
    //   //                             ),
    //   //                           ),
    //   //                         ),
    //   //                         Expanded(
    //   //                           child: Container(
    //   //                             decoration: BoxDecoration(
    //   //                                 border: Border.all(color: Colors.grey)),
    //   //                             child: TextButton(
    //   //                               child: Text(
    //   //                                 "답변완료",
    //   //                                 style: TextStyle(color: Colors.grey),
    //   //                               ),
    //   //                               onPressed: () {
    //   //                                 // 전체보기 눌렀을 때. 모든 설정 초기화.
    //   //                               },
    //   //                             ),
    //   //                           ),
    //   //                         )
    //   //                       ],
    //   //                     ),
    //   //                     SizedBox(height: 12),
    //   //                     Text(
    //   //                       "기간 조회",
    //   //                       style: TextStyle(
    //   //                         color: Colors.black,
    //   //                         fontWeight: FontWeight.bold,
    //   //                       ),
    //   //                     ),
    //   //                     SizedBox(height: 12), // 간격 조정
    //   //                     Row(
    //   //                       children: [
    //   //                         Container(
    //   //                           color: Colors.blue, // 버튼 바탕색
    //   //                           child: TextButton(
    //   //                             child: Text(
    //   //                               "전체시기",
    //   //                               style: TextStyle(color: Colors.white),
    //   //                             ),
    //   //                             onPressed: () {
    //   //                               // 동작 설정
    //   //                             },
    //   //                           ),
    //   //                         ),
    //   //                         Container(
    //   //                           decoration: BoxDecoration(
    //   //                               border: Border.all(color: Colors.grey)),
    //   //                           child: TextButton(
    //   //                             child: Text(
    //   //                               "1주일",
    //   //                               style: TextStyle(color: Colors.grey),
    //   //                             ),
    //   //                             onPressed: () {
    //   //                               // 동작 설정
    //   //                             },
    //   //                           ),
    //   //                         ),
    //   //                         Container(
    //   //                           decoration: BoxDecoration(
    //   //                               border: Border.all(color: Colors.grey)),
    //   //                           child: TextButton(
    //   //                             child: Text(
    //   //                               "1개월",
    //   //                               style: TextStyle(color: Colors.grey),
    //   //                             ),
    //   //                             onPressed: () {
    //   //                               // 동작 설정
    //   //                             },
    //   //                           ),
    //   //                         ),
    //   //                         Container(
    //   //                           decoration: BoxDecoration(
    //   //                               border: Border.all(color: Colors.grey)),
    //   //                           child: TextButton(
    //   //                             child: Text(
    //   //                               "3개월",
    //   //                               style: TextStyle(color: Colors.grey),
    //   //                             ),
    //   //                             onPressed: () {
    //   //                               // 동작 설정
    //   //                             },
    //   //                           ),
    //   //                         ),
    //   //                         Container(
    //   //                           decoration: BoxDecoration(
    //   //                               border: Border.all(color: Colors.grey)),
    //   //                           child: TextButton(
    //   //                             child: Text(
    //   //                               "기간 설정",
    //   //                               style: TextStyle(color: Colors.grey),
    //   //                             ),
    //   //                             onPressed: () {
    //   //                               // 동작 설정
    //   //                             },
    //   //                           ),
    //   //                         ),
    //   //                       ],
    //   //                     ),
    //   //                     SizedBox(height: 10), // 간격 조정
    //   //                     Row(
    //   //                       children: [
    //   //                         Expanded(
    //   //                           child: ElevatedButton(
    //   //                             child: Text("취소"),
    //   //                             onPressed: () {
    //   //                               // 탭바 접기
    //   //                             },
    //   //                           ),
    //   //                         ),
    //   //                         SizedBox(width: 10), // 간격 조정
    //   //                         Expanded(
    //   //                           child: ElevatedButton(
    //   //                             child: Text("적용하기"),
    //   //                             onPressed: () {
    //   //                               // 적용하고 탭바접기
    //   //                             },
    //   //                           ),
    //   //                         ),
    //   //                       ],
    //   //                     ),
    //   //                   ],
    //   //                 ),
    //   //               ),
    //   //             ],
    //   //           ),
    //   //         ),
    //   //       ),
    //   //     ],
    //   //   ),
    //   // ),
    // );
  }
}
