import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreatorMyPageBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    //탭바
                    _buildTabBar(),
                    Expanded(
                      child: TabBarView(
                        children: [
                          //탭바 그리드
                          _buildTabGrid(),
                          //탭바 옷장
                          _buildTabCloset(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
            bottom: 66,
            left: 10,
            right: 10,
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "지원하기",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ))
      ],
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      tabs: [
        Tab(icon: Icon(CupertinoIcons.circle_grid_3x3_fill)),
        Tab(icon: Icon(Icons.meeting_room_rounded)),
      ],
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 3.0, // 밑줄의 두께 설정
          ),
        ),
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
                  aspectRatio: 4,
                  child: ClipRRect(
                    child: Image.network(
                        // "https://picsum.photos/400/400",
                        "https://picsum.photos/id/${index + 1}/600/600",
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("옷제목",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    Text(
                      "옷설명",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    //numberFormat 사용하면되
                    Text(
                      "가격 : 10,000원",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabGrid() {
    return Align(child: Text("크리에이터가 되어 자신의 멋진 코디를 뽐내 보세요.!!"));
  }

  //가격 1,000원 쉼표, 넣기
  String numberFormat(String price) {
    final formatter = NumberFormat('#,###');
    return formatter.format(int.parse(price));
  }
}
