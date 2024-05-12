import 'dart:convert';
import 'package:final_project_team02/ui/holder/item/components/item_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:final_project_team02/ui/components/main_app_bar.dart';
import 'package:final_project_team02/ui/holder/item/item_datail_viewmodel.dart';
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
          MainAppBar(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: model!.mainPhotos.length,
                itemBuilder: (context, index) {
                  return Image.memory(
                    Base64Decoder()
                        .convert(model!.mainPhotos[index].mainPhotoBase64),
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          )
        ];
      },
      body: ItemDetailView(model:model,itemId: itemId),
    );
  }
}
