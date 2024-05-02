import 'package:final_project_team02/data/domain_data/popular_outfit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodiModel {
  List<Ootd> list;

  CodiModel(this.list);
}

class CodiViewModel extends StateNotifier<CodiModel?> {
  CodiViewModel(super.state);
}

final codiProvider = StateNotifierProvider<CodiViewModel, CodiModel?>((ref) {
  return CodiViewModel(null);
});
