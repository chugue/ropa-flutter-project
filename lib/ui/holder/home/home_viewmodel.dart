import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/repositoreis/home_repo.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/home/home_data/popular_codi_photos.dart';
import 'package:final_project_team02/ui/holder/home/home_data/popular_items_photos.dart';
import 'package:final_project_team02/ui/holder/home/home_data/popular_user_photos.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// HomeModel 클래스는 홈 화면에 필요한 데이터 모델을 정의합니다.
class HomeModel {
  final List<PopularUserPhotos> userPhotos; // 사용자의 인기 있는 사진 목록
  final List<PopularCodiPhotos> codiPhotos; // 인기 있는 코디 사진 목록
  final List<PopularItemsPhotos> itemsPhotos; // 인기 있는 아이템 사진 목록

  // 모든 필드를 필수로 받는 생성자를 정의합니다.
  const HomeModel({
    required this.codiPhotos,
    required this.itemsPhotos,
    required this.userPhotos,
  });

  HomeModel copyWith({
    List<PopularUserPhotos>? userPhotos,
    List<PopularCodiPhotos>? codiPhotos,
    List<PopularItemsPhotos>? itemsPhotos,
  }) {
    return HomeModel(
      userPhotos: userPhotos ?? this.userPhotos,
      codiPhotos: codiPhotos ?? this.codiPhotos,
      itemsPhotos: itemsPhotos ?? this.itemsPhotos,
    );
  }
}

// HomeViewModel 클래스는 StateNotifier를 상속받아 상태 관리를 수행합니다.
class HomeViewModel extends StateNotifier<HomeModel?> {
  final mContext = navigatorKey.currentContext; // 현재 애플리케이션 컨텍스트에 접근

  // 생성자에서 초기 상태를 super를 통해 설정합니다.
  HomeViewModel(super.state);

  void addNewCodiPhotos(PopularCodiPhotos codiPhotos) {
    if (state != null) {
      List<PopularCodiPhotos> updatedCodiPhotos = [
        codiPhotos,
        ...state!.codiPhotos
      ];
      state = state!.copyWith(codiPhotos: updatedCodiPhotos);
    }
  }

  // notifyInit는 비동기 함수로, 홈 화면 데이터를 초기화합니다.
  Future<void> notifyInit() async {
    ResponseDTO responseDTO =
        await HomeRepo().callHomeList(); // 서버로부터 홈 리스트 데이터를 요청합니다.

    // 서버 응답이 성공적일 경우, 응답 데이터를 HomeModel 객체로 변환하여 상태를 업데이트합니다.
    if (responseDTO.success) {
      HomeModel homeModel = responseDTO.response;
      state = homeModel; // 상태 업데이트
    }
  }
}

// homeProvider는 StateNotifierProvider를 사용하여 HomeViewModel의 인스턴스를 생성 및 관리합니다.
final homeProvider = StateNotifierProvider<HomeViewModel, HomeModel?>((ref) {
  return HomeViewModel(null)..notifyInit(); // 초기 상태를 null로 설정하고, 데이터 로딩을 시작합니다.
});
