import 'dart:ui';

import 'package:final_project_team02/ui/holder/buy/buy_page.dart';
import 'package:final_project_team02/ui/holder/item/components/item_cart_dialog.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/cart/cart_page.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/cart/components/cart_page_body.dart';
import 'package:flutter/material.dart';

import 'item_buy_options.dart';

class ItemBuyButton extends StatelessWidget {
  const ItemBuyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> optionList = ['1','2','3'];
    final String optionName = '수량';


    double screenWidth = MediaQuery.of(context).size.width * 0.85;
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 250,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ]),
          child: Center(
            child: Text(
              "구매하기",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                        width: 50,
                        height: 2,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: DropdownMenu<String>(
                      width: screenWidth,
                      initialSelection: "${optionName}" /* 📢초기 선택 값 */,
                      onSelected: (String? value) {} /* 📢콜백 함수 */,
                      dropdownMenuEntries: [
                        DropdownMenuEntry<String>(
                          value: "${optionName}",
                          label: "${optionName}",
                        ),
                        ...optionList.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                            value: value,
                            label: value,
                          );
                        }).toList(),
                        // 📢 리스트의 각 항목을 DropdownMenuEntry<String>로 변환. 목록에 추가
                      ],
                    ),
                  ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            hoverColor: Colors.transparent,
                            onTap: () {
                              Navigator.pop(context);

                              showDialog(
                                context: context,
                                builder: (context) {
                                  return ItemCartDialog();
                                },
                              );
                            },
                            child: Container(
                              width: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "장바구니",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all()),
                            ),
                          ),
                          InkWell(
                            hoverColor: Colors.transparent,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BuyPage()));
                            },
                            child: Container(
                              width: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "구매하기",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
            );
          },

          /// 바텀시트 드래그 가능 여부
          enableDrag: true,

          /// 바텀시트가 아닌 부분을 클릭했을 때 닫기
          isDismissible: true,

          /// 사이즈 조절
          constraints: const BoxConstraints(
            maxWidth: double.infinity,
            maxHeight: 230,
          ),

          isScrollControlled: true,

          /// 바텀시트 배경 컬러
          backgroundColor: Colors.transparent,
          useSafeArea: true,
        );
      },
    );
  }
}


