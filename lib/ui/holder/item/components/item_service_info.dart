import 'package:flutter/cupertino.dart';
import 'package:icons_plus/icons_plus.dart';

class ItemServiceInfo extends StatelessWidget {
  const ItemServiceInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "고객센터 051-912-1000",
                style: TextStyle(fontSize: 16.0),
              ),
              Icon(
                FontAwesome.chevron_right_solid,
                size: 16.0,
              )
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            "상담 오전 9시 ~ 오후 5시 (주말 공휴일 휴무)",
            style: TextStyle(fontSize: 14.0),
          ),
          Text(
            "점심 오후 12시 ~ 오후 1시",
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
