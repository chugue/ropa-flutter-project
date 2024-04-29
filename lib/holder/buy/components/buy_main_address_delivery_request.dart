import 'package:final_project_team02/holder/buy/components/buy_main_address_delivery_request_save_default_address.dart';
import 'package:flutter/cupertino.dart';

import 'buy_main_address_delivery_request_dropdown_messages.dart';

class BuyMainAddressDeliveryRequest extends StatelessWidget {
  const BuyMainAddressDeliveryRequest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: Column(
          children: [
            DropDownMessages(),
            SaveDefaultAdress(),
          ],
        ),
      ),
    );
  }
}
