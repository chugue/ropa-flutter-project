import 'package:flutter/material.dart';

class ItemSelectScroll extends StatelessWidget {
  const ItemSelectScroll({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    "테스트",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
