import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "인기 크리에이터",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18.0),
        ),
      ),
    );
  }
}
