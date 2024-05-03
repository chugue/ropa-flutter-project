import 'package:final_project_team02/models/inquiry.dart';
import 'package:final_project_team02/ui/holder/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InquiryPage2 extends StatelessWidget {
  const InquiryPage2({super.key});

  @override
  Widget build(BuildContext context) {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              icon: Icon(Icons.home_filled))
        ],
      ),
      body: ListView.builder(
        itemCount: inquiryList.length,
        itemBuilder: (context, index) {
          /* DateTime 포맷 */
          String formattedDate = DateFormat('yyyy-MM-dd HH:mm')
              .format(inquiryList[index].createdAt);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                onTap: () {},
                tileColor: Colors.grey[200],
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      inquiryList[index].state,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: inquiryList[index].state == "답변 완료"
                            ? Colors.blue
                            : Colors.black,
                      ),
                    ),
                    Text(
                      formattedDate,
                      style: TextStyle(fontSize: 12.0),
                    )
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "제목 : ",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          inquiryList[index].title,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "내용 : ",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          inquiryList[index].content.length > 20
                              ? inquiryList[index].content.substring(0, 20) +
                                  "...(더보기)"
                              : inquiryList[index].content,
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
