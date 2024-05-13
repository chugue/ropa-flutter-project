import 'package:final_project_team02/data/dtos/buy_req.dart';
import 'package:flutter/material.dart';
import 'package:final_project_team02/ui/holder/port_one/port_one_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../buy_viewmodel.dart';

class BuyOrderButton extends ConsumerWidget {
  final String text;
  BuyModel model;

  BuyOrderButton({
    required this.text,
    required this.model,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: 350,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            PurchaseInfo purchaseInfo = PurchaseInfo(
              orderAmount: model.orderInfo.orderAmount,
              deliveryType: "FREE",
              deliveryFee: model.orderInfo.deliveryFee,
              discount: model.orderInfo.discount,
              purchaseAmount: model.orderInfo.purchaseAmount,
              payMethod: model.orderInfo.payMethod,
              savedPayMethod: model.orderInfo.savedPayMethod,
            );

            BuySaveReqDTO reqDTO = BuySaveReqDTO(
              name: model.buy.name,
              phone: model.buy.phone,
              email: model.buy.email,
              address: model.buy.address,
              isBaseAddress: model.buy.isBaseAddress,
              deliveryRequest: model.buy.deliveryRequest,
              detailAddress: model.buy.detailAddress,
              purchaseInfo: purchaseInfo,
              postCode: "12345",
            );

            //여기에 메소드 넣기
            ref.read(buyProvider.notifier).buySave(reqDTO);
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87,
            padding: EdgeInsets.symmetric(vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
