import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/global_data/user.dart';
import 'package:final_project_team02/data/repositoreis/user_repo.dart';
import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/user_data/codi_list.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/user_data/item_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// MODEL
class CreatorModel {
  final User user;
  final List<CodiList> codiList;
  final List<ItemList> itemList;

  CreatorModel({
    required this.user,
    required this.codiList,
    required this.itemList,
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

  Future<ResponseDTO> notifyInit() async {
    ResponseDTO responseDTO = await UserRepo().callCreatorView();

    if (responseDTO.success) {
      CreatorModel creatorModel = responseDTO.response;
      state = creatorModel;
    }
    return responseDTO;
  }
}

// PROVIDER
// final creatorProvider =
//     StateNotifierProvider.family<CreatorViewModel, CreatorModel?, int>(
//   (ref, creatorId) {
//     SessionData sessionData = ref.read(sessionProvider);
//
//     return CreatorViewModel(null, ref, sessionData)..notifyInit(creatorId);
//   },
// );
final creatorProvider = StateNotifierProvider<CreatorViewModel, CreatorModel?>(
  (ref) {
    SessionData sessionData = ref.read(sessionProvider);
    return CreatorViewModel(null, ref, sessionData)..notifyInit();
  },
);
