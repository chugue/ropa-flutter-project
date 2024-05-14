import 'package:final_project_team02/_core/constants/http.dart'; // HTTP 통신 관련 상수와 설정을 관리하는 파일을 임포트합니다.
import 'package:final_project_team02/data/dtos/respons_dto.dart'; // 응답 데이터 전송 객체를 정의한 파일을 임포트합니다.
import 'package:final_project_team02/ui/holder/home/home_data/popular_codi_photos.dart'; // 인기 코디 사진 데이터 모델을 정의한 파일을 임포트합니다.
import 'package:final_project_team02/ui/holder/home/home_data/popular_items_photos.dart'; // 인기 아이템 사진 데이터 모델을 정의한 파일을 임포트합니다.
import 'package:final_project_team02/ui/holder/home/home_data/popular_user_photos.dart'; // 인기 사용자 사진 데이터 모델을 정의한 파일을 임포트합니다.
import 'package:final_project_team02/ui/holder/home/home_viewmodel.dart'; // 홈 뷰 모델을 관리하는 파일을 임포트합니다.

// HomeRepo 클래스는 홈 화면 데이터를 서버로부터 불러오는 기능을 수행합니다.
class HomeRepo {
  // callHomeList 함수는 비동기로 서버에서 홈 화면에 표시할 리스트 데이터를 요청합니다.
  Future<ResponseDTO> callHomeList() async {
    // dio 객체를 사용해 서버의 '/home-lists' 엔드포인트로 GET 요청을 보냅니다.
    final response = await dio.get('/home-lists');

    // 서버로부터 받은 응답을 ResponseDTO 객체로 변환합니다.
    ResponseDTO responseDTO =
        ResponseDTO.fromJson(response.data); // 여기에 응답 데이터 들어감

    // 응답의 성공 여부를 확인합니다.
    if (responseDTO.success) {
      // 응답에서 "popularUserPhotos" 키에 해당하는 데이터를 추출합니다.
      List<dynamic> popularUserPhotos =
          responseDTO.response["popularUserPhotos"];

      // 여기서 사용할 객체로 변환
      // 추출된 데이터를 PopularUserPhotos 모델로 변환하여 리스트를 생성합니다.
      List<PopularUserPhotos> UserPhotos =
          popularUserPhotos.map((e) => PopularUserPhotos.fromJson(e)).toList();

      // 응답에서 "popularItemsPhotos" 키에 해당하는 데이터를 추출합니다.
      List<dynamic> popularItemsPhotos =
          responseDTO.response["popularItemsPhotos"];

      // 추출된 데이터를 PopularItemsPhotos 모델로 변환하여 리스트를 생성합니다.
      List<PopularItemsPhotos> ItemsPhotos = popularItemsPhotos
          .map((e) => PopularItemsPhotos.fromJson(e))
          .toList();

      // 응답에서 "popularCodiPhotos" 키에 해당하는 데이터를 추출합니다.
      List<dynamic> popularCodiPhotos =
          responseDTO.response["popularCodiPhotos"];

      // 추출된 데이터를 PopularCodiPhotos 모델로 변환하여 리스트를 생성합니다.
      List<PopularCodiPhotos> CodiPhotos =
          popularCodiPhotos.map((e) => PopularCodiPhotos.fromJson(e)).toList();

      // 추출 및 변환된 모든 데이터를 포함하는 HomeModel 객체를 생성합니다.
      HomeModel homeModel = HomeModel(
          codiPhotos: CodiPhotos,
          itemsPhotos: ItemsPhotos,
          userPhotos: UserPhotos);

      // HomeModel 객체를 응답 DTO의 response 필드에 할당합니다.
      responseDTO.response = homeModel;
    }
    // 최종적으로 변환된 ResponseDTO 객체를 반환합니다.
    return responseDTO;
  }
}
