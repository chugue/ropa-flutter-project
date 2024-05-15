import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/dtos/user_req.dart';
import 'package:final_project_team02/data/global_data/user.dart';
import 'package:final_project_team02/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApplyModel {
  final User user;

  ApplyModel({
    required this.user,
  });
}

class ApplyViewModel extends StateNotifier<ApplyModel?> {
  final mContext = navigatorKey.currentContext;

  ApplyViewModel(super.state);
}

//flutt
final applyProvider = StateNotifierProvider<ApplyViewModel, ApplyModel?>((ref) {
  return ApplyViewModel(null);
});
