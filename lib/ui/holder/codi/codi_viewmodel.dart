import 'package:final_project_team02/data/domain_data/ootd.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodiModel {
  List<Ootd> ootdList;

  CodiModel(this.ootdList);
}

class CodiViewModel extends StateNotifier<CodiModel?> {
  CodiViewModel(super.state);
}

final codiProvider = StateNotifierProvider<CodiViewModel, CodiModel?>((ref) {
  return CodiViewModel(ootdList.first.id);
});
