import 'dart:ui';

import 'package:final_project_team02/data/dtos/cart_req.dart';
import 'package:final_project_team02/ui/holder/buy/buy_page.dart';
import 'package:final_project_team02/ui/holder/item/item_datail_viewmodel.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/cart/cart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemBuyButton extends ConsumerWidget {
  final int itemId;

  const ItemBuyButton({
    required this.itemId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ItemDetailListModel? model = ref.watch(itemDetailListProvider(itemId));
    final List<String> optionList = ['1', '2', '3'];
    final String optionName = '수량';

    // 유효한 선택지인지 확인하고, 아니면 첫 번째 옵션을 기본값으로 설정
    int? currentItem = model?.selecteItem;
    bool isValidItem = optionList.contains(currentItem?.toString());
    // int defaultValue = int.parse(optionList.first);

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
                        width: 100,
                        height: 2,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // child: Padding(
                        //   padding: const EdgeInsets.only(bottom: 8.0),
                        //   child: Align(
                        //     child: DropdownButton<int>(
                        //       hint: Text("수량"),
                        //       value: isValidItem ? currentItem : null,
                        //       onChanged: (int? newValue) {
                        //         if (newValue != null) {
                        //           ref
                        //               .read(itemDetailListProvider(itemId)
                        //                   .notifier)
                        //               .updateSelection(newValue);
                        //         }
                        //       },
                        //       style: TextStyle(
                        //         color: Colors.black, // 드롭다운 텍스트 색상
                        //         fontSize: 16,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //       dropdownColor: Colors.white,
                        //       // 드롭다운 배경 색상 설정
                        //       items: optionList
                        //           .map<DropdownMenuItem<int>>((String value) {
                        //         return DropdownMenuItem<int>(
                        //           value: int.parse(value), // 문자열을 정수로 변환
                        //           child: Container(
                        //             width: 200, // Width of each dropdown item
                        //             height: 40, // Height of each dropdown item
                        //             alignment: Alignment.centerLeft,
                        //             child: Text(value.toString()),
                        //           ),
                        //         );
                        //       }).toList(),
                        //     ),
                        //   ),
                        // ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            hoverColor: Colors.transparent,
                            onTap: () {
                              Navigator.pop(context);

                              CartSaveDTO reqDTO =
                                  CartSaveDTO(itemId: itemId, quantity: 1);
                              ref.read(cartProvider.notifier).cartSave(reqDTO);
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
