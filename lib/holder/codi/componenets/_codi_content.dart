import 'package:flutter/material.dart';

class CodiContent extends StatelessWidget {
  const CodiContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          "내게는 소중했던 잠못 이루던 날들이 너에겐 지금과 다르지 않았다."
          "사랑은 비극이어라 그대는 내가 아니다 추억은 다르게 적힌다",
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
