import 'package:flutter/material.dart';

class BuyPayMentDefaultOptions extends StatefulWidget {
  @override
  State<BuyPayMentDefaultOptions> createState() =>
      _BuyPayMentDefaultOptionsState();
}

class _BuyPayMentDefaultOptionsState extends State<BuyPayMentDefaultOptions> {
  bool _saveDefaultBuyOption = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          Checkbox(
            fillColor: MaterialStateColor.resolveWith(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.black; // 체크되었을 때의 색상
                }
                return Colors.white; // 비체크 상태일 때의 색상
              },
            ),
            value: _saveDefaultBuyOption,
            onChanged: (value) {
              setState(() {
                _saveDefaultBuyOption = !_saveDefaultBuyOption;
              });
            },
          ),
          InkWell(
            onTap: () {
              setState(() {
                _saveDefaultBuyOption = !_saveDefaultBuyOption;
              });
            },
            child: Text(
              "결제수단과 입력정보를 다음에도 사용",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
