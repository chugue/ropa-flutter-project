import 'package:final_project_team02/ui/holder/buy/buy_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Option {
  final int id;
  final String text;
  final String payMethod;

  const Option({
    required this.id,
    required this.text,
    required this.payMethod,
  });
}

class BuyPayMentOptions extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BuyModel? model = ref.watch(buyProvider);
    int? selectedValue = model!.selectedOptionId;
    final List<Option> options = [
      Option(id: 1, text: "카카오페이 간편 결제", payMethod: "KAKAO"),
      Option(id: 2, text: "토스페이 간편 결제", payMethod: "TOSS"),
      Option(id: 3, text: "신용카드", payMethod: "CREDIT"),
      Option(id: 4, text: "무통장 입금 (가상계좌)", payMethod: "TRANSFER"),
    ];

    return Column(
      children: options.map((option) {
        bool isSelected = model.selectedOptionId == option.id;

        return InkWell(
          onTap: () {
            ref
                .watch(buyProvider.notifier)
                .selectPayment(option.id, option.payMethod);
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
                isSelected ? Icon(Icons.check, color: Colors.blue) : SizedBox(),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
