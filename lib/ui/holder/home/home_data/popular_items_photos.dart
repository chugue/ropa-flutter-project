import 'package:final_project_team02/data/global_data/admin_info.dart';

class PopularItemsPhotos {
  final int photoId;
  final int itemsId;
  final String name;
  final String photoPath;
  final String sort;
  final AdminInfo adminInfo;

  const PopularItemsPhotos({
    required this.photoId,
    required this.itemsId,
    required this.name,
    required this.photoPath,
    required this.sort,
    required this.adminInfo,
  });

  factory PopularItemsPhotos.fromJson(Map<String, dynamic> json) {
    return PopularItemsPhotos(
      photoId: json["photoId"],
      itemsId: json["itemsId"],
      name: json["name"],
      photoPath: json["photoPath"] ?? '',
      sort: json["sort"],
      adminInfo: AdminInfo.fromJson(json["adminInfo"]),
    );
  }
//
}
