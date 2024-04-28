import 'package:flutter/cupertino.dart';

import '../../../models/popular_outfit.dart';

class CodiList extends StatelessWidget {
  const CodiList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: ootdList.length * 120 /* 수정 해야함. */,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // ✅한 행에 두 개의 항목
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: ootdList.length,
            itemBuilder: (context, index) {
              return Image.asset(
                ootdList[index].Img,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
    );
  }
}
