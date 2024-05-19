import 'package:final_project_team02/ui/holder/serach/components/search_tab_bar.dart';
import 'package:final_project_team02/ui/holder/serach/components/search_tab_view_Item.dart';
import 'package:final_project_team02/ui/holder/serach/components/search_tab_view_codi.dart';
import 'package:flutter/material.dart';

import 'components/search_body.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SearchBody(),
    );
  }
}
