import 'package:final_project_team02/ui/holder/home/home_data/popular_codi_photos.dart';
import 'package:final_project_team02/ui/holder/home/home_data/popular_items_photos.dart';
import 'package:final_project_team02/ui/holder/home/home_data/popular_user_photos.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeModel {
  final List<PopularCodiPhotos> CodiPhotos;
  final List<PopularItemsPhotos> ItemsPhotos;
  final List<PopularUserPhotos> UserPhotos;

  const HomeModel({
    required this.CodiPhotos,
    required this.ItemsPhotos,
    required this.UserPhotos,
  });
}

class HomeViewModel extends StateNotifier<HomeModel?> {
  HomeViewModel(super.state);
}

final homeProvider = StateNotifierProvider<HomeViewModel, HomeModel?>((ref) {
  return HomeViewModel(null);
});
