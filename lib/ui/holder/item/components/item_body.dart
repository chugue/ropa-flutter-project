import 'dart:convert';

import 'package:final_project_team02/_core/constants/move.dart';
import 'package:final_project_team02/ui/holder/item/components/item_detail_view.dart';
import 'package:final_project_team02/ui/holder/item/item_datail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemBody extends ConsumerWidget {
  const ItemBody({
    required this.itemId,
  });

  final int itemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ItemDetailListModel? model = ref.watch(itemDetailListProvider(itemId));

    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            pinned: false,
            floating: true,
            snap: false,
            expandedHeight: 200,
            // collapsedHeight: 100,
            // toolbarHeight: 100,

            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Move.mainHolder, (route) => false);
                      },
                      child: Container(
                        height: 150,
                        child: Image.asset(
                          "assets/images/ropa_home_logo.png",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: model.mainPhotos.length,
                itemBuilder: (context, index) {
                  return Image.memory(
                    Base64Decoder()
                        .convert(model.mainPhotos[index].mainPhotoBase64),
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "[${model!.item.brandName}] ",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '여기때문에?',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${model!.item.discountPrice}원",
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "${model!.item.price}원",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ];
      },
      body: ItemDetailView(model: model, itemId: itemId),
    );
  }
}
