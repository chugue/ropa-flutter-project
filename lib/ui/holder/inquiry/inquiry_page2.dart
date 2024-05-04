import 'package:final_project_team02/models/inquiry.dart';
import 'package:final_project_team02/ui/holder/home/home_page.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_detail_page/InquiryDetailPage.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_insert_page/InquiryInsertPage.dart';
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
          "1대1 문의내역",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            icon: Icon(Icons.home_filled),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: inquiryList.length,
            itemBuilder: (context, index) {
              /* DateTime 포맷 */
              String formattedDate = DateFormat('yyyy-MM-dd HH:mm')
                  .format(inquiryList[index].createdAt);

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
              );
            },
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InquiryInsertPage()));
                },
                child: Text(
                  "1대1 문의하기",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
