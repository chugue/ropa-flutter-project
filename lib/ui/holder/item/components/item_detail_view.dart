import 'dart:convert';
import 'dart:ui';
import 'package:final_project_team02/ui/holder/item/components/item_buy_button.dart';
import 'package:final_project_team02/ui/holder/item/item_datail_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemDetailView extends StatelessWidget {
  final int itemId;
  final ItemDetailListModel? model;

  ItemDetailView({
    required this.itemId,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "[${model!.item.brandName}] ",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                '여기때문에?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${model!.item.discountPrice}원",
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
              SizedBox(width: 8),
              Text(
                "${model!.item.price}원",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough),
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height, // 미디어 쿼리 대신 고정 높이 사용
            child: ListView.builder(
              itemCount: model!.detailPhotos.length,
              itemBuilder: (context, index) {
                return Image.memory(
                  Base64Decoder()
                      .convert(model!.detailPhotos[index].subPhotoBase64),
                  fit: BoxFit.fill,
                );
              },
            ),
          ),
        ),
        ItemBuyButton(),
      ],
    );

  }
}
//
// class AnimatedProgressIndicator extends StatefulWidget {
//   @override
//   _AnimatedProgressIndicatorState createState() =>
//       _AnimatedProgressIndicatorState();
// }
//
// class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
//     with SingleTickerProviderStateMixin {
//   AnimationController? _controller;
//   Animation<double>? _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         AnimationController(vsync: this, duration: Duration(seconds: 2));
//     _animation = Tween<double>(begin: 0, end: 1).animate(_controller!)
//       ..addListener(() {
//         setState(() {});
//       });
//     _controller!.repeat(reverse: true);
//   }
//
//   @override
//   void dispose() {
//     _controller!.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: CircularProgressIndicator(
//         value: _animation!.value,
//         valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade200),
//         strokeWidth: 7,
//       ),
//     );
//   }
// }
