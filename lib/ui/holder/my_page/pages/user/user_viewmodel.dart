import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../data/global_data/user.dart';
import '../../../../../main.dart';

class UserMyPageModel {
  final User user;

  UserMyPageModel(this.user);
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
