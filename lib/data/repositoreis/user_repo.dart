import 'package:dio/dio.dart';
import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/dtos/user_req.dart';
import 'package:final_project_team02/data/global_data/user.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/creator_data/creator.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/creator_data/creator_codi_list.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/creator_data/creator_item_list.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/creator_viewmodel.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator_view/creator_view_data/creator_view.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator_view/creator_view_data/creator_view_codi_list.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator_view/creator_view_data/creator_view_item_list.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator_view/creator_view_viewmodel.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/profile/profile_data/user_profile.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/settings/setting_data/user_setting.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/user_data/user_my_page.dart';
import 'package:logger/logger.dart';

class UserRepo {
  Future<ResponseDTO> callUserProfileUpdate(
      int userId, UserProfileUpdateDTO reqDTO) async {
    Response response = await dio.put("/user/profile/${userId}",
        data: reqDTO.toJson(),
        options: Options(headers: {"Authorization": "$globalAccessToken"}));
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.success) {
      responseDTO.response = User.fromJson(responseDTO.response);
    }
    return responseDTO;
  }
  Future<ResponseDTO> callCreatorMyPage() async {
    final response = await dio.get("/app/creator-my-page");
    Logger().d(response.data);

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.success) {
      Creator user = Creator.fromJson(responseDTO.response["userDTO"]);

      List<dynamic> codi = responseDTO.response["codiList"];
      List<CreatorCodiList> codiList =
          codi.map((e) => CreatorCodiList.fromJson(e)).toList();

      List<dynamic> item = responseDTO.response["itemList"];
      List<CreatorItemList> itemList =
          item.map((e) => CreatorItemList.fromJson(e)).toList();

      CreatorModel model = CreatorModel(
        user: user,
        codiList: codiList,
        itemList: itemList,
      );

      responseDTO.response = model;
    }

    return responseDTO;
  }

  Future<ResponseDTO> callAutoLogin(String accessToken) async {
    Response response = await dio.post("/app/auto/login",
        options: Options(headers: {"Authorization": "$accessToken"}));
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.success) {
      responseDTO.response = User.fromJson(responseDTO.response);
    }
    return responseDTO;
  }

  Future<ResponseDTO> callUserMyPage() async {
    final response = await dio.get("/app/user-my-page");
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.success) {
      responseDTO.response = UserMyPage.fromJson(responseDTO.response);
    }

    return responseDTO;
  }

  Future<ResponseDTO> callCreatorView(int creatorId) async {
    final response = await dio.get("/app/creator-view/${creatorId}");

    // 🔀PARSING
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.success) {
      CreatorView user = CreatorView.fromJson(responseDTO.response["userDTO"]);

      List<dynamic> codi = responseDTO.response["codiList"];
      List<CreatorViewCodiList> codiList =
          codi.map((e) => CreatorViewCodiList.fromJson(e)).toList();
      // Logger().d(codiList);

      List<dynamic> item = responseDTO.response["itemList"];
      List<CreatorViewItemList> itemList =
          item.map((e) => CreatorViewItemList.fromJson(e)).toList();

      CreatorVModel model = CreatorVModel(
        user: user,
        codiList: codiList,
        itemList: itemList,
      );

      responseDTO.response = model;
    }

    return responseDTO;
  }

  Future<ResponseDTO> callUserCreatorApply(
      UserCreatorApplyReqDTO reqDTO) async {
    final response = await dio.put("/app/creator-apply",
        data: reqDTO.toJson(),
        options: Options(headers: {'Authorization': globalAccessToken}));
    // Logger().d(response.data!);

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.success) {
      responseDTO.response = User.fromJson(responseDTO.response);
      // Logger().d(responseDTO.response);
    }
    return responseDTO;
  }

  Future<ResponseDTO> callUserSetting() async {
    final response = await dio.get("/app/setting");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.success) {
      responseDTO.response = UserSetting.fromJson(responseDTO.response);
    }
    return responseDTO;
  }

  Future<ResponseDTO> callUserProfile() async {
    final response = await dio.get("/app/profile");
    // Logger().d(response.data!);
    // 🔀PARSING
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.success) {
      responseDTO.response = UserProfile.fromJson(responseDTO.response);
    }
    return responseDTO;
  }

  Future<ResponseDTO> callJoin(JoinReqDTO reqDTO) async {
    final response = await dio.post("/user/join", data: reqDTO.toJson());
    // Logger().d(response.data!);

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    return responseDTO;
  }

  Future<(ResponseDTO, String)> callLogin(LoginReqDTO reqDTO) async {
    final response = await dio.post("/user/login", data: reqDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.success) {
      responseDTO.response = User.fromJson(responseDTO.response);
      final accessToken = response.headers["Authorization"]!.first;
      logger.d('${response.headers["Authorization"]!.first}');

      return (responseDTO, accessToken);
    } else {
      throw new Exception("${responseDTO.errorMessage}");
    }
  }
}
