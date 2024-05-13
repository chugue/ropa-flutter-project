import 'package:final_project_team02/data/global_data/brand.dart';
import 'package:flutter/material.dart';

class ItemInsertPage extends StatelessWidget {
  const ItemInsertPage({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
          style: TextStyle(fontSize: 24.0),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 30.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ItemInsertBody(screenWidth: screenWidth),
    );
  }
}

class ItemInsertBody extends StatelessWidget {
  const ItemInsertBody({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: brands.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.network(
                      brands[index].logo,
                      width: 60,
                      height: 60,
                    ),
                    SizedBox(height: 4),
                    Text(
                      brands[index].name,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7, // 📢가로세로 비율 조정
            ),
            itemCount: 2,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenWidth * 0.48,
                        height: screenWidth * 0.48,
                        child: Image.network(
                            "https://picsum.photos/id/${index + 1}/1000/1000",
                            fit: BoxFit.cover),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '테스트',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '테스트',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// 브랜드 정보를 담는 클래스 예시
