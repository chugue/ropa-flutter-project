import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/codi_item_data/item_info.dart';

class Brand {
  final int brandId;
  final int photoId;
  final String photoPath;
  final List<ItemInfo> itemInfo;

  const Brand({
    required this.brandId,
    required this.photoId,
    required this.photoPath,
    required this.itemInfo,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      brandId: json["brandId"],
      photoId: json["photoId"],
      photoPath: json["photoPath"],
      itemInfo: (json["itemInfo"] as List<dynamic>)
          .map((i) => ItemInfo.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
  }
}
