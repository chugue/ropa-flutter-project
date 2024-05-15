import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/components/codi_item_brand_tab_bar.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/components/codi_item_brand_tab_view.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/components/codi_item_insert_brand_scroll.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/components/codi_item_select_scroll.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/components/user_my_page_body_bottom_tab_bar_closet.dart';
import 'package:flutter/material.dart';

class ItemInsertBody extends StatelessWidget {
  const ItemInsertBody({super.key, required this.category});

  final String category;

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
                titlePadding: EdgeInsets.only(bottom: 40,left: 50),
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
                child: CodiItemBrandTabBar(),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            CodiItemBrandTabView(),

            CodiItemBrandTabView(),
          ],
        ),
      ),
    );
  }
}
