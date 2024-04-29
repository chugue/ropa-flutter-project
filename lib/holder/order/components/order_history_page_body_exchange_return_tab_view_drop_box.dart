import 'package:final_project_team02/holder/order/components/custom_inquiry_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../_core/constants/theme.dart';


class OrderHistoryPageBodyExchangeReturnTabViewDropBox extends StatefulWidget {
  List<String> list;

  OrderHistoryPageBodyExchangeReturnTabViewDropBox({
    required this.list,
  });

  @override
  State<OrderHistoryPageBodyExchangeReturnTabViewDropBox> createState() => _OrderHistoryPageBodyOrderTabViewDropBoxState();
}

class _OrderHistoryPageBodyOrderTabViewDropBoxState extends State<OrderHistoryPageBodyExchangeReturnTabViewDropBox> {
  @override
  Widget build(BuildContext context) {
    String? selectedValue;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        value: selectedValue, // 선택된 값. 초기 힌트 표시를 원하면 null로 설정
        hint: Text("교환/반품 조회", textAlign: TextAlign.center), // 힌트 텍스트
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue;
          });
        },

        items: widget.list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
