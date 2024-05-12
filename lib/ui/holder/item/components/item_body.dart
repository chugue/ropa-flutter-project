import 'dart:convert';
import 'package:final_project_team02/_core/constants/move.dart';
import 'package:final_project_team02/ui/holder/item/components/item_detail_view.dart';
import 'package:final_project_team02/ui/holder/item/components/item_info.dart';
import 'package:final_project_team02/ui/holder/item/components/item_main_slide.dart';
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
                  padding: const EdgeInsets.only(top:40),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Move.mainHoder, (route) => false);
                    },
                    child: Container(
                      height:150,
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
            child: ItemMainSlide(model: model),
          ),
          SliverToBoxAdapter(
            child: ItemInfo(model: model),
          ),
        ];
      },
      body: ItemDetailView(model: model, itemId: itemId),
    );
  }
}

