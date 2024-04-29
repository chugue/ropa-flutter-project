import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../_core/constants/theme.dart';
import 'order_page_body_title.dart';

class Order {
  int id;
  String title;
  double amount;

  Order({
    required this.id,
    required this.title,
    required this.amount,
  });
}

List<Order> orderHistory = [
  Order(id: 1, title: "주문 1", amount: 100),
  Order(id: 2, title: "주문 2", amount: 200),
];

class OrderPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildBoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(width: 50, height: 3, color: Colors.grey),
                    SizedBox(height: 15),
                    OrderPageBodyTitle(title: "주문내역"),
                    SizedBox(height: 20),
                    Divider(),
                  ],
                ),
              )
            ];
          },
          body: Column(
            children: [
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      TabBar(
                        tabs: [
                          Text("최근주문내역",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text(" 교환/반품",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: TabBarView(
                          children: [
                            order(),
                            Column(
                              children: [Text("asdf")],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
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
                padding: EdgeInsets.only(left: 10),
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

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      color: Colors.white,
    );
  }
}

class order extends StatelessWidget {
  List<String> list = ["배송중", "배송완료", "배송전"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        DropdownButton<String>(
                          value: null, // 선택된 값. 초기 힌트 표시를 원하면 null로 설정
                          hint: Text("배송조회"), // 힌트 텍스트
                          onChanged: (String? newValue) {},
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: 1, // 리스트에 표시할 항목의 개수
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text("배송중",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            width: 80,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'https://picsum.photos/200/100',
                                // :TODO 04 사진수정
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('상의 이름', style: textTheme().displayMedium),
                              Text('배송: [무료] / 기본배송',
                                  style: textTheme().displayMedium),
                              SizedBox(width: 16),
                              Text('상품구매금액: 352,000원 ',
                                  style: textTheme().displayMedium),
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                      Text("[옵션 : free ]"),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Divider(),
        InkWell(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text("1:1 문의 하기",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ),
          ),
        ),
        SizedBox(height: 20)
      ],
    );
  }
}
