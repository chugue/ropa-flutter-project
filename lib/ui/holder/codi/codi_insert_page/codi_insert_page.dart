import 'package:flutter/material.dart';

import '../../../../models/codi.dart';

class CodiInsertPage extends StatefulWidget {
  const CodiInsertPage({super.key});

  @override
  State<CodiInsertPage> createState() => _CodiInsertPageState();
}

class _CodiInsertPageState extends State<CodiInsertPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "이제 더 멋지게 \n스타일을 완성해주세요!",
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 120,
                child: ListView.builder(
                  itemBuilder: (context, int CodiIndex) {
                    return Container(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: codiList[CodiIndex]
                            .mainImg
                            .length /* ✅TODO : 추 후 + 1 */,
                        itemBuilder: (context, int index) {
                          if (index ==
                              codiList[CodiIndex].mainImg.length -
                                  1) /* ✅-1 지울 것*/ {
                            return GestureDetector(
                              onTap: () {
                                // TODO : 이미지 업로드 기능 구현
                                print(
                                    "🧡💛💚💙💜🤎🖤🤍플러스 눌러짐🧡💛💚💙💜🤎🖤🤍");
                                setState(() {});
                              },
                              child: Container(
                                width: 120,
                                height: 120,
                                color: Colors.grey[200],
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                  color: Colors.grey[400],
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              margin: EdgeInsets.only(right: 16),
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      codiList[CodiIndex].mainImg[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 50),

              /* 👔👖🧣🧤🧦👜👔👖🧣🧤🧦👜👔👖🧣🧤🧦👜 */

              Text(
                "착용 아이템",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Container(
                height: 80,
                child: ListView.builder(
                  itemBuilder: (context, int CodiIndex) {
                    return Container(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == codiList[CodiIndex].itemImg.length) {
                            return GestureDetector(
                              onTap: () {
                                // 이미지 업로드 기능 구현
                              },
                              child: Container(
                                width: 80,
                                height: 80,
                                color: Colors.grey[200],
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                  color: Colors.grey[400],
                                ),
                              ),
                            );
                          } else {
                            return Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 16.0),
                                  width: 80,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          codiList[CodiIndex].itemImg[index]),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                Text(
                                  "Outer", // 여기에 텍스트를 추가하세요
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 50),
              Text(
                "스타일링 코멘트",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextField(
                maxLength: 150,
                maxLines: null,
                minLines: 3,
                decoration: InputDecoration(
                  hintText: "스타일링 포인트는 무엇인가요?",
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  // 상하 여백 조절
                  hintStyle: TextStyle(color: Colors.grey), // hintText의 위치 조절
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
