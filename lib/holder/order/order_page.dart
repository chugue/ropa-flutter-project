import 'package:flutter/material.dart';

import 'components/order_page_body.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({
    required this.orderId,
  });

  final int orderId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return OrderPageBody();

            // return Scaffold(
            //   body: NestedScrollView(
            //     headerSliverBuilder: (context, innerBoxIsScrolled) {
            //       return [
            //         Expanded(
            //           child: DefaultTabController(
            //             length: 2,
            //             child: Expanded(
            //               child: Column(
            //                 children: [
            //                   TabBar(
            //                     tabs: [
            //                       Tab(
            //                           icon: Icon(
            //                               CupertinoIcons.circle_grid_3x3_fill)),
            //                       Tab(icon: Icon(Icons.meeting_room_rounded)),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         )
            //       ];
            //     },
            //     body: TabBarView(
            //       children: [
            //         //탭바 그리드
            //         _buildTabGrid(),
            //         //탭바 옷장
            //         _buildTabCloset(),
            //       ],
            //     ),
            //   ),
            // );
          },

          //바텀 모양
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),

          /// 바텀시트 드래그 가능 여부
          enableDrag: true,

          /// 바텀시트가 아닌 부분을 클릭했을 때 닫기
          // isDismissible: true,

          /// 사이즈 조절
          constraints: const BoxConstraints(
              // maxWidth: double.infinity,
              // maxHeight: 1000,
              ),

          isScrollControlled: true,

          /// 바텀시트 배경 컬러
          backgroundColor: Colors.transparent,
          useSafeArea: true,
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("주문조회", style: TextStyle(color: Colors.black26, fontSize: 25)),
          Text("${orderId}",
              style: TextStyle(color: Colors.black, fontSize: 20)),
        ],
      ),
    );
  }

  Widget _buildTabCloset() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 1,
        crossAxisCount: 2,
        mainAxisSpacing: 0,
      ),
      itemCount: 42,
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 2 / 1,
                  child: ClipRRect(
                    child: Image.network(
                        // "https://picsum.photos/400/400",
                        "https://picsum.photos/id/${index + 1}/600/600",
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("옷제목",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    Text("옷설명",
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                        )),
                    //numberFormat 사용하면되
                    Text(
                      "가격 : 10,000원",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabGrid() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 2,
        crossAxisCount: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: 42,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            InkWell(
              onTap: () {},
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                    "https://picsum.photos/id/${index + 1}/1000/1000",
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Icon(
                Icons.auto_awesome_motion,
                color: Colors.white,
              ),
              //auto_awesome_motion
              //style
              //filter_none
            )
          ],
        );
      },
    );
  }
}
