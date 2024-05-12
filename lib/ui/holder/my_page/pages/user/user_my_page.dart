import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/ui/components/login_is_check.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/components/creator_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../components/custom_app_bar.dart';
import 'components/user_my_page_body.dart';

class UserMyPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionData sessionData = ref.watch(sessionProvider);
    if (sessionData.user?.id == null) {
      return LoginIsCheck();
    } else {
      if (sessionData.user!.blueChecked == false) {
        return Scaffold(
          appBar: CustomAppBar(
            home: Icons.home,
            setting: Icons.settings,
            cart: Icons.shopping_basket,
          ),
          backgroundColor: Colors.white,
          body: UserMyPageBody(),
        );
      } else {
        return Scaffold(
          appBar: CustomAppBar(
            home: Icons.home,
            setting: Icons.settings,
            cart: Icons.shopping_basket,
          ),
          backgroundColor: Colors.white,
          body: CreatorBody(),
        );
      }
    }
  }
}
