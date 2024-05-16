import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/codi_item_data/item_info.dart';

class Brand {
  final int brandId;
  final int photoId;
  final String brandName;
  final String photoName;
  final String base64;
  final List<ItemInfo> itemInfo;

  const Brand({
    required this.brandId,
    required this.photoId,
    required this.brandName,
    required this.photoName,
    required this.base64,
    required this.itemInfo,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      brandId: json["brandId"],
      photoId: json["photoId"],
      brandName: json["brandName"],
      photoName: json["photoName"],
      base64: json["base64"],
      itemInfo: (json["itemInfo"] as List<dynamic>)
          .map((i) => ItemInfo.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
  }
}
