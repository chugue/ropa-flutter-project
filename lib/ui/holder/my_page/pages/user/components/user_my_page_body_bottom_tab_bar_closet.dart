import 'package:flutter/material.dart';

class UserTabCloset extends StatelessWidget {
  const UserTabCloset({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.checkroom_outlined,
                  color: Colors.grey,
                  size: 30,
                ),
                Positioned(
                  top: 8,
                  child: Container(
                    width: 60,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "옷장이 비었습니다.",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
    // ✅ 기존 아이템 뿌리기 더미
    //   GridView.builder(
    //   physics: NeverScrollableScrollPhysics(),
    //   shrinkWrap: true,
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisSpacing: 1,
    //     crossAxisCount: 2,
    //     mainAxisSpacing: 0,
    //   ),
    //   itemCount: 42,
    //   itemBuilder: (context, index) {
    //     return Container(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Expanded(
    //             child: AspectRatio(
    //               aspectRatio: 4,
    //               child: ClipRRect(
    //                 child: Image.network(
    //                     // "https://picsum.photos/400/400",
    //                     "https://picsum.photos/id/${index + 1}/600/600",
    //                     fit: BoxFit.cover),
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.only(left: 10),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text("옷제목",
    //                     style: TextStyle(
    //                         color: Colors.black,
    //                         fontSize: 25,
    //                         fontWeight: FontWeight.bold)),
    //                 Text(
    //                   "옷설명",
    //                   style: TextStyle(
    //                     overflow: TextOverflow.ellipsis,
    //                   ),
    //                 ),
    //                 //numberFormat 사용하면되
    //                 Text(
    //                   "가격 : 10,000원",
    //                   style: TextStyle(fontWeight: FontWeight.bold),
    //                 ),
    //                 SizedBox(height: 15),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}
