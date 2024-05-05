import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainHolderModel {
  final int selectedIndexId;

  const MainHolderModel({
    required this.selectedIndexId,
  });
}

class MainHolderViewModel extends StateNotifier<MainHolderModel> {
  MainHolderViewModel() : super(MainHolderModel(selectedIndexId: 0));
}

final mainHolderProvider =
    StateNotifierProvider<MainHolderViewModel, MainHolderModel>((ref) {
  return MainHolderViewModel();
});
