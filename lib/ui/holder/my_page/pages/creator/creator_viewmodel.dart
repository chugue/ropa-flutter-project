import 'package:final_project_team02/data/dtos/respons_dto.dart'; // 응답 DTO 클래스 임포트
import 'package:final_project_team02/data/global_data/creator.dart'; // 크리에이터 데이터 클래스 임포트
import 'package:final_project_team02/data/repositoreis/user_repo.dart'; // 사용자 리포지토리 클래스 임포트
import 'package:final_project_team02/data/session_data/session_data.dart'; // 세션 데이터 클래스 임포트
import 'package:final_project_team02/main.dart'; // 메인 파일 임포트 (navigatorKey 사용)
import 'package:final_project_team02/ui/holder/my_page/pages/user/user_data/codi_list.dart'; // 코디 리스트 데이터 클래스 임포트
import 'package:final_project_team02/ui/holder/my_page/pages/user/user_data/item_list.dart'; // 아이템 리스트 데이터 클래스 임포트
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Riverpod 상태 관리 패키지 임포트

// MODEL 클래스 정의: 크리에이터 관련 데이터를 포함
class CreatorModel {
  final Creator user; // 크리에이터 사용자 정보
  final List<CodiList> codiList; // 크리에이터의 코디 리스트
  final List<ItemList> itemList; // 크리에이터의 아이템 리스트

  // CreatorModel 생성자: 필수 필드를 초기화
  CreatorModel({
    required this.user,
    required this.codiList,
    required this.itemList,
  });
}

// VIEW MODEL 클래스 정의: 상태 관리 및 비즈니스 로직 처리
class CreatorViewModel extends StateNotifier<CreatorModel?> {
  final mContext = navigatorKey.currentContext; // 네비게이션 컨텍스트를 가져옴
  Ref ref; // Riverpod의 Ref 객체: 다른 provider와 상호작용
  SessionData sessionData; // 세션 데이터

  // CreatorViewModel 생성자: 초기 상태와 필요한 객체들을 초기화
  CreatorViewModel(
    super.state,
    this.ref,
    this.sessionData,
  );

  // 초기화 메소드: 주어진 creatorId에 대해 크리에이터 정보를 초기화
  Future<ResponseDTO> notifyInit(creatorId) async {
    // UserRepo를 사용하여 크리에이터 뷰 데이터를 가져옴
    ResponseDTO responseDTO = await UserRepo().callCreatorView();

    // 응답이 성공적일 경우 상태 업데이트
    if (responseDTO.success) {
      CreatorModel creatorModel = responseDTO.response;
      state = creatorModel; // 상태를 새로운 CreatorModel로 설정
    }
    return responseDTO; // 응답 DTO 반환
  }
}

// PROVIDER 정의: CreatorViewModel 인스턴스를 생성하고 초기화
final creatorProvider =
    StateNotifierProvider.family<CreatorViewModel, CreatorModel?, int>(
  (ref, creatorId) {
    // SessionData를 provider에서 읽어옴
    SessionData sessionData = ref.read(sessionProvider);

    // CreatorViewModel 인스턴스를 생성하고 초기화 메소드 호출
    return CreatorViewModel(null, ref, sessionData)..notifyInit(creatorId);
  },
);

// 주석 처리된 다른 형태의 provider 정의 예제: 기본 형태의 StateNotifierProvider 사용
// final creatorProvider = StateNotifierProvider<CreatorViewModel, CreatorModel?>(
//   (ref) {
//     return CreatorViewModel(null, ref,s)..notifyInit();
//   },
// );
