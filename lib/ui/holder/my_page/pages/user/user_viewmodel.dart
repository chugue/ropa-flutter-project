import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/global_data/user.dart';
import 'package:final_project_team02/data/repositoreis/user_repo.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/user_data/user_codi_list.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/user_data/user_item_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// MODEL
class UserMyPageModel {
  final User user;
  final List<UserCodiList> userCodiList;
  final List<UserItemList> userItemList;

  UserMyPageModel({
    required this.user,
    required this.userCodiList,
    required this.userItemList,
  });
}

// VIEW MODEL
class UserMyPageViewModel extends StateNotifier<UserMyPageModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  // SessionData sessionData;

  UserMyPageViewModel(
    super.state,
    this.ref,
    // this.sessionData,
  );

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await UserRepo().callUserMyPage();

    if (responseDTO.success) {
      state = responseDTO.response;
    }
  }
}

// PROVIDER
final UserMyPageProvider =
    StateNotifierProvider.family<UserMyPageViewModel, UserMyPageModel?, int>(
        (ref, userId) {
  return UserMyPageViewModel(null, ref)..notifyInit();
});
