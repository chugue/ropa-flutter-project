import 'package:final_project_team02/holder/buy/components/save_default_address.dart';
import 'package:flutter/cupertino.dart';

import 'dropdown-messages.dart';

class DelieveryRequest extends StatelessWidget {
  const DelieveryRequest({
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
