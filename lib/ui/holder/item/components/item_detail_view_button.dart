import 'package:final_project_team02/ui/holder/item/item_datail_viewmodel.dart';
import 'package:flutter/material.dart';

class ItemDetailViewButton extends StatefulWidget {
  final ItemDetailListModel? model;

  const ItemDetailViewButton({super.key, this.model});

  @override
  _ItemDetailButtonState createState() => _ItemDetailButtonState();
}

class _ItemDetailButtonState extends State<ItemDetailViewButton> {
  bool isDetailShown = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                isDetailShown ? "접기" : "상세정보",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(double.infinity, 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
              ),
            ),
            // Container(
            //   width: double.infinity, // 셀의 전체 너비 사용
            //   height: double.infinity, // 셀의 전체 높이 사용
            //   child: Image.memory(
            //     Base64Decoder().convert(model!.mainPhotos.mainPhotoBase64),
            //     fit: BoxFit.cover,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
