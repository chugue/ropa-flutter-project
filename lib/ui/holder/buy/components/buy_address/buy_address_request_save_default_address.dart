import 'package:flutter/material.dart';

class BuyAddressRequestSaveDefaultAddress extends StatefulWidget {
  const BuyAddressRequestSaveDefaultAddress({
    super.key,
  });

  @override
  State<BuyAddressRequestSaveDefaultAddress> createState() =>
      _BuyAddressRequestSaveDefaultAddressState();
}

class _BuyAddressRequestSaveDefaultAddressState
    extends State<BuyAddressRequestSaveDefaultAddress> {
  bool _saveDefaultAddress = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          Checkbox(
            fillColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.black; // 체크되었을 때의 색상
              }
              return Colors.white; // 비체크 상태일 때의 색상
            }),
            value: _saveDefaultAddress,
            onChanged: (value) {
              setState(() {
                _saveDefaultAddress = !_saveDefaultAddress;
              });
            },
          ),
          InkWell(
            onTap: () {
              setState(() {
                _saveDefaultAddress = !_saveDefaultAddress;
              });
            },
            child: Text(
              "기본 배송지로 저장",
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
