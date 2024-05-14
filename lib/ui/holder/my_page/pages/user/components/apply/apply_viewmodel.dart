import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/dtos/user_request.dart';
import 'package:final_project_team02/data/global_data/user.dart';
import 'package:final_project_team02/data/repositoreis/user_repo.dart';
import 'package:final_project_team02/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class ApplyModel {
  final User user;

  ApplyModel({
    required this.user,
  });
}

class ApplyViewModel extends StateNotifier<ApplyModel?> {
  final mContext = navigatorKey.currentContext;

  ApplyViewModel(super.state);

  // Future<void> UserCreatorApply(UserCreatorApplyReqDTO reqDTO) async {
  //   ResponseDTO responseDTO = await UserRepo().callUserCreatorApply(reqDTO);
  //
  //   if (responseDTO.success) {
  //     ApplyModel applyModel = responseDTO.response;
  //     Logger().d(applyModel.toString());
  //     state = Sess;
  //   }
  // }
}

//flutt
final applyProvider = StateNotifierProvider<ApplyViewModel, ApplyModel?>((ref) {
  return ApplyViewModel(null);
});
