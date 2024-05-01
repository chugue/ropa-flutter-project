import 'package:final_project_team02/ui/holder/buy/components/buy_address/buy_address_request_drop_messages.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_address/buy_address_request_save_default_address.dart';
import 'package:flutter/cupertino.dart';

class BuyMainAddressRequest extends StatelessWidget {
  const BuyMainAddressRequest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: Column(
          children: [
            BuyAddressRequestDropMessages(),
            BuyAddressRequestSaveDefaultAddress(),
          ],
        ),
      ),
    );
  }
}
