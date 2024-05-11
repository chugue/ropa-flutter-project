import 'dart:convert';

import 'package:final_project_team02/ui/holder/item/item_datail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemBody extends ConsumerWidget {
  final int itemId;

  const ItemBody({
    required this.itemId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ItemDetailListModel? model = ref.watch(itemDetailListProvider(itemId));
    if (model == null) {
      return Center(
        child: AnimatedProgressIndicator(),
      );
    }
    return CustomScrollView(
      slivers: [
        // 이미지 슬라이더를 위한 SliverList
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.width, // 미디어 쿼리 대신 고정 높이 사용
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: model.mainPhotos.length,
              itemBuilder: (context, index) {
                return Image.memory(
                  Base64Decoder()
                      .convert(model.mainPhotos[index].mainPhotoBase64),
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        // 제품 브랜드 및 이름을 위한 SliverToBoxAdapter
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "[${model.item.brandName}] ",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${model.item.brandName}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        // 가격 정보를 위한 SliverToBoxAdapter
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${model.item.discountPrice}원",
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
                SizedBox(width: 8),
                Text(
                  "${model.item.price}원",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 60),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height, // 미디어 쿼리 대신 고정 높이 사용
            child: ListView.builder(
              itemCount: model.detailPhotos.length,
              itemBuilder: (context, index) {
                return Image.memory(
                  Base64Decoder()
                      .convert(model.detailPhotos[index].subPhotoBase64),
                  fit: BoxFit.fill,
                );
              },
            ),
          ),
        ),
        // 추가 정보를 위한 SliverList
        // 다른 Sliver 위젯들을 더 추가할 수 있습니다.
      ],
    );
  }
}

class AnimatedProgressIndicator extends StatefulWidget {
  @override
  _AnimatedProgressIndicatorState createState() =>
      _AnimatedProgressIndicatorState();
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });
    _controller!.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        value: _animation!.value,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade200),
        strokeWidth: 7,
      ),
    );
  }
}
