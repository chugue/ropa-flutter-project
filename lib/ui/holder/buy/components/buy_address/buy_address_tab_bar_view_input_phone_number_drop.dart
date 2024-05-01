import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class BuyAddressTabBarViewInputPhoneNumberDrop extends StatefulWidget {
  const BuyAddressTabBarViewInputPhoneNumberDrop({super.key});

  @override
  State<BuyAddressTabBarViewInputPhoneNumberDrop> createState() =>
      _BuyAddressTabBarViewInputPhoneNumberDropState();
}

class _BuyAddressTabBarViewInputPhoneNumberDropState
    extends State<BuyAddressTabBarViewInputPhoneNumberDrop> {
  final List<String> list = <String>['010', '011', '016', '017', '018', '019'];
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = list.first;
  }

  void _showModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          height: 400,
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListTile(
                      title: Text(list[index]),
                      onTap: () {
                        setState(() {
                          dropdownValue = list[index];
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Divider(height: 1),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showModal,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black38),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                dropdownValue ?? '010',
                style: TextStyle(fontSize: 15, color: Colors.black87),
              ),
            ),
            Icon(Ionicons.chevron_down_outline, size: 16),
          ],
        ),
      ),
    );
  }
}
