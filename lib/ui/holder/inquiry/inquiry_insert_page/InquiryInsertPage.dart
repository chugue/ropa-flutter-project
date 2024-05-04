import 'package:flutter/material.dart';

class InquiryInsertPage extends StatelessWidget {
  const InquiryInsertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("문의 작성"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("제목*"),
            TextField(
              decoration: InputDecoration(
                hintText: "제목을 적어주세요.",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text("설명*"),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "내용을 적어주세요.",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO : 문의하기 버튼을 눌렀을 때 처리할 로직 추가
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // 모서리를 살짝 둥글게 설정
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "문의하기",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
