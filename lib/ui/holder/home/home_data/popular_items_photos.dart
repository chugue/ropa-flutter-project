import 'package:final_project_team02/data/global_data/admin_info.dart';

class PopularItemsPhotos {
  final int photoId;
  final int itemsId;
  final String name;
  final String base64;
  final String sort;
  final AdminInfo adminInfo;

  const PopularItemsPhotos({
    required this.photoId,
    required this.itemsId,
    required this.name,
    required this.base64,
    required this.sort,
    required this.adminInfo,
  });

  factory PopularItemsPhotos.fromJson(Map<String, dynamic> json) {
    return PopularItemsPhotos(
      photoId: json["photoId"],
      itemsId: json["itemsId"],
      name: json["name"],
      base64: json["base64"] ?? '',
      sort: json["sort"],
      adminInfo: AdminInfo.fromJson(json["adminInfo"]),
    );
  }
//
}
