import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreatorPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
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

  //가격 1,000원 쉼표, 넣기
  String numberFormat(String price) {
    final formatter = NumberFormat('#,###');
    return formatter.format(int.parse(price));
  }
}
