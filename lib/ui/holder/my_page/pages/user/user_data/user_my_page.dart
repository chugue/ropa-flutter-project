import 'package:final_project_team02/data/dtos/user_dto.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/user_data/user_codi_list.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/user_data/user_item_list.dart';

class UserMyPage {
  UserDTO userDTO;
  UserCodiList codiList;
  UserItemList itemList;

  UserMyPage({
    required this.userDTO,
    required this.codiList,
    required this.itemList,
  });

  factory UserMyPage.fromJson(Map<String, dynamic> json) {
    return UserMyPage(
      userDTO: UserDTO.fromJson(json["userDTO"]),
      codiList: UserCodiList.fromJson(json["codiList"]),
      itemList: UserItemList.fromJson(json["itemList"]),
    );
  }
}
