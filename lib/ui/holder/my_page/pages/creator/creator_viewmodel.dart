import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator_view/creator_data/creator.dart';
import 'package:final_project_team02/data/repositoreis/user_repo.dart';
import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/user_data/codi_list.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/user_data/item_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// MODEL
class CreatorModel {
  final Creator user;
  final List<CodiList> codiList;
  final List<ItemList> itemList;

  CreatorModel({
    required this.user,
    required this.codiList,
    required this.itemList,
  });

  CreatorModel copyWith({
    Creator? user,
    List<CodiList>? codiList,
    List<ItemList>? itemList,
  }) {
    return CreatorModel(
      user: user ?? this.user,
      codiList: codiList ?? this.codiList,
      itemList: itemList ?? this.itemList,
    );
  }
}

// VIEW MODEL
class CreatorViewModel extends StateNotifier<CreatorModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;
  SessionData sessionData;

  CreatorViewModel(super.state,
      this.ref,
      this.sessionData,);

  Future<ResponseDTO> notifyInit(creatorId) async {
    ResponseDTO responseDTO = await UserRepo().callCreatorView(creatorId);

    if (responseDTO.success) {
      CreatorModel creatorModel = responseDTO.response;
      state = creatorModel;
    }
    return responseDTO;
  }

  void addNewCodi(CodiList newCodi) {
    if (state != null) {
      List<CodiList> updatedCodiList = List.from(state!.codiList)..add(newCodi);
      state = state!.copyWith(codiList: updatedCodiList);
    }
  }
}

// PROVIDER
final creatorProvider =
StateNotifierProvider.family<CreatorViewModel, CreatorModel?, int>(
      (ref, creatorId) {
    SessionData sessionData = ref.read(sessionProvider);

    return CreatorViewModel(null, ref, sessionData)
      ..notifyInit(creatorId);
  },
);
// final creatorProvider = StateNotifierProvider<CreatorViewModel, CreatorModel?>(
//   (ref) {
//     return CreatorViewModel(null, ref,s)..notifyInit();
//   },
// );
