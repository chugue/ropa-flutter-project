import 'package:final_project_team02/models/inquiry.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InquiryDetailPage extends StatelessWidget {
  final InquiryItem inquiry;

  const InquiryDetailPage({Key? key, required this.inquiry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("1:1 문의 내용"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title, Content, Date Container
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.quora,
                        size: 30,
                      ),
                      Text(
                        " " + inquiry.title,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    inquiry.content,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    DateFormat('yyyy-MM-dd HH:mm').format(inquiry.createdAt),
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Answer Container
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: inquiry.state == "답변 완료"
                    ? Colors.blue[100]
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        inquiry.state,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: inquiry.state == "답변 완료"
                              ? Colors.blue
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "내용 : ${inquiry.answer}",
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  if (inquiry.state == "답변 완료")
                    Text(
                      DateFormat('yyyy-MM-dd HH:mm')
                          .format(inquiry.answerCreatedAt),
                      style: TextStyle(fontSize: 14.0),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
