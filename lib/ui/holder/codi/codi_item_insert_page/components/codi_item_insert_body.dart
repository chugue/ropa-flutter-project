import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/codi_item_insert_viewmodel.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/components/codi_item_brand_tab_bar.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/components/codi_item_brand_tab_view.dart';
import 'package:flutter/material.dart';

class ItemInsertBody extends StatelessWidget {
  final String category;
  final CodiItemInsertModel model;

  const ItemInsertBody({
    required this.category,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                      category,
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
                child: CodiItemBrandTabBar(model: model),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            CodiItemBrandTabView(
              model: model,
              selectedIndex: 0,
            ),
            CodiItemBrandTabView(
              model: model,
              selectedIndex: 1,
            ),
            CodiItemBrandTabView(
              model: model,
              selectedIndex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
