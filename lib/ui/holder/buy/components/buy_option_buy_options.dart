import 'package:flutter/material.dart';

class BuyOptions extends StatefulWidget {
  @override
  _BuyOptionsState createState() => _BuyOptionsState();
}

class _BuyOptionsState extends State<BuyOptions> {
  int? selectedValue;

  List<Option> _options = [
    Option(id: 1, text: "카카오페이 간편 결제"),
    Option(id: 2, text: "토스페이 간편 결제"),
    Option(id: 3, text: "신용카드"),
    Option(id: 4, text: "무통장 입금 (가상계좌)"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _options.map((option) {
        bool isSelected = selectedValue == option.id;

        return InkWell(
          onTap: () {
            setState(() {
              selectedValue = option.id;
            });
          },
          child: Container(
            padding: EdgeInsets.all(20),
            height: 65,
            decoration: BoxDecoration(
              border:
                  Border.all(color: isSelected ? Colors.blue : Colors.black12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  option.text,
                  style: TextStyle(
                    color: isSelected ? Colors.blue : Colors.black,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                  ),
                ),
                isSelected
                    ? Icon(
                        Icons.check,
                        color: Colors.blue,
                      )
                    : SizedBox(),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class Option {
  final int id;
  final String text;

  const Option({
    required this.id,
    required this.text,
  });
}
