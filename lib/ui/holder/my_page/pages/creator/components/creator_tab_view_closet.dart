import 'package:final_project_team02/ui/holder/my_page/pages/creator/components/creator_Item_list_view.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/creator_viewmodel.dart';
import 'package:flutter/material.dart';

class CreatorTabViewCloset extends StatelessWidget {
  final CreatorModel model;

  const CreatorTabViewCloset({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return model.itemList.isEmpty
        // ✅ itemList가 비었을 때 메세지
        ? _emptyItemList()

        // ✅ itemList 뿌리기
        : CreatorItemListView(model: model);
  }

  Center _emptyItemList() {
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
                    height: 1.5,
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
  }
}
