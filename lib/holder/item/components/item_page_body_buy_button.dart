import 'dart:ui';

import 'package:flutter/material.dart';

import 'item_page_body_item_options.dart';

class ItemBuyButton extends StatelessWidget {
  const ItemBuyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          color: Colors.black,
          child: Center(
            child: TextButton(
              child: Text("구매하기",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              onPressed: () /* 📢 "구매하기" 클릭 시 BottomSheet 모달 */ {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return BackdropFilter /* 📢 블러 효과 */ (
                      filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                      child: Container /* ✅ 모달 */ (
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration /* 📢 모달 꾸미기 */ (
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "구매하기",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 40),
                              ItemOptions(
                                optionName: "색상",
                                optionList: ["그린", "머스타드", "베이지", "네이비", "블랙"],
                              ),
                              ItemOptions(
                                optionName: "사이즈",
                                optionList: ["M", "L", "XL"],
                              ),
                              InkWell(
                                hoverColor: Colors.transparent,
                                onTap: () {},
                                child: Container(
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },

                  /// 바텀시트 드래그 가능 여부
                  enableDrag: true,

                  /// 바텀시트가 아닌 부분을 클릭했을 때 닫기
                  isDismissible: true,

                  /// 사이즈 조절
                  constraints: const BoxConstraints(
                    maxWidth: double.infinity,
                    maxHeight: 550,
                  ),

                  isScrollControlled: true,

                  /// 바텀시트 배경 컬러
                  backgroundColor: Colors.transparent,
                  useSafeArea: true,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
