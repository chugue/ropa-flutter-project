import 'dart:convert';

import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/codi_item_data/item_info.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/codi_item_insert_viewmodel.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/components/codi_item_brand_tab_bar.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/components/codi_item_brand_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemInsertBody extends ConsumerWidget {
  final String? category;

  const ItemInsertBody({
    required this.category,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CodiItemInsertModel? model = ref.watch(codiItemInsertProvider(category));

    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return DefaultTabController(
        length: model.brandList.length,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 100,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  titlePadding: EdgeInsets.only(bottom: 50, left: 60),
                  title: Row(
                    children: [
                      Text(
                        '$category',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(48),
                  child: TabBar(
                    tabs: List<Widget>.generate(
                        model.brandList.length, (index) {
                      return Tab(
                        child: Image.memory(
                          base64Decode(model.brandList[index].base64),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: List<Widget>.generate(model.brandList.length, (index) {
              return CodiItemBrandTabView(
                model: model,
                selectedIndex: index,
              );
            }),
          ),
        ),
      );
    }
  }
}