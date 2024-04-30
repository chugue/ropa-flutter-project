import 'package:flutter/material.dart';

class ItemDetailButton extends StatefulWidget {
  const ItemDetailButton({super.key});

  @override
  _ItemDetailButtonState createState() => _ItemDetailButtonState();
}

class _ItemDetailButtonState extends State<ItemDetailButton> {
  bool isDetailShown = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isDetailShown = !isDetailShown /* ✅클릭 시 !=  */;
                });
              },
              child: Text(
                isDetailShown ? "접기" : "상세정보",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(double.infinity, 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
              ),
            ),
            if (isDetailShown) ...[
              Image.network(
                "https://static.lookpin.co.kr/20230621151259-7b87/8e57f39c698bb2efca1b7afce03c0fa7.jpg",
                width: 400,
                fit: BoxFit.contain,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
