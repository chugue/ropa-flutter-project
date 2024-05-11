import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/repositoreis/home_repo.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/home/home_data/popular_codi_photos.dart';
import 'package:final_project_team02/ui/holder/home/home_data/popular_items_photos.dart';
import 'package:final_project_team02/ui/holder/home/home_data/popular_user_photos.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class HomeModel {
  final List<PopularUserPhotos> userPhotos;
  final List<PopularCodiPhotos> codiPhotos;
  final List<PopularItemsPhotos> itemsPhotos;

  const HomeModel({
    required this.codiPhotos,
    required this.itemsPhotos,
    required this.userPhotos,
  });
}

class HomeViewModel extends StateNotifier<HomeModel?> {
  final mContext = navigatorKey.currentContext;

  HomeViewModel(super.state);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await HomeRepo().callHomeList();

    if (responseDTO.success) {
      HomeModel homeModel = responseDTO.response;
      state = homeModel;
    }
  }
}

//flutt
final homeProvider = StateNotifierProvider<HomeViewModel, HomeModel?>((ref) {
  return HomeViewModel(null)..notifyInit();
});
