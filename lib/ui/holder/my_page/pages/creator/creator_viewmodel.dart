import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/global_data/user.dart';
import 'package:final_project_team02/data/repositoreis/user_repo.dart';
import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/user_data/user_codi_list.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/user_data/user_item_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// MODEL
class CreatorModel {
  final User user;
  final List<UserCodiList> userCodiList;
  final List<UserItemList> userItemList;

  CreatorModel({
    required this.user,
    required this.userCodiList,
    required this.userItemList,
  });
}

// VIEW MODEL
class CreatorViewModel extends StateNotifier<CreatorModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;
  SessionData sessionData;

  CreatorViewModel(
    super.state,
    this.ref,
    this.sessionData,
  );

  Future<void> notifyInit(int creatorId) async {
    ResponseDTO responseDTO = await UserRepo().callUserMyPage();

    if (responseDTO.success) {
      CreatorModel creatorModel = responseDTO.response;
      state = creatorModel;
    }
  }
}

// PROVIDER
final CreatorProvider =
    StateNotifierProvider.family<CreatorViewModel, CreatorModel?, int>(
        (ref, creatorId) {
  SessionData sessionData = ref.read(sessionProvider);

  return CreatorViewModel(null, ref, sessionData)..notifyInit(creatorId);
});
