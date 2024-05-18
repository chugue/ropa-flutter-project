import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/repositoreis/user_repo.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/user_data/user_my_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// MODEL
class UserMyPageModel {
  UserMyPage userMyPage;

  UserMyPageModel(this.userMyPage);
}

// VIEW MODEL
class UserMyPageViewModel extends StateNotifier<UserMyPageModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  UserMyPageViewModel(
    super.state,
    this.ref,
  );

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await UserRepo().callUserMyPage();

    if (responseDTO.success) {
      // UserMyPageModel userMyPageModel = responseDTO.response;
      // state = userMyPageModel;
      state = UserMyPageModel(responseDTO.response);
    }
  }
}

// PROVIDER
final userMyPageProvider =
    StateNotifierProvider<UserMyPageViewModel, UserMyPageModel?>(
  (ref) {
    return UserMyPageViewModel(null, ref)..notifyInit();
  },
);
