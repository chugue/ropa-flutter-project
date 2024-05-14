import 'package:final_project_team02/data/global_data/user.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/order/order_data/item_history_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserMyPageModel {
  final User user;
  final ItemHistoryList itemHistoryList;

  const UserMyPageModel({
    required this.user,
    required this.itemHistoryList,
  });
}

class UserMyPageViewModel extends StateNotifier<UserMyPageModel?> {
  Ref ref;
  final mContext = navigatorKey.currentContext;

  UserMyPageViewModel(super.state, this.ref);
}

final userMyPageProvider =
    StateNotifierProvider.family<UserMyPageViewModel, UserMyPageModel?, int>(
        (ref, userId) {
  return UserMyPageViewModel(null, ref);
});
