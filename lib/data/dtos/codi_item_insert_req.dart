import 'dart:convert';

class CodiItemInsertReqDTO {
  final int userId;
  final String description;
  final List<CodiPhotos> codiPhotos;
  final List<Items> items;

  const CodiItemInsertReqDTO({
    required this.userId,
    required this.description,
    required this.codiPhotos,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      "userId": this.userId,
      "description": this.description,
      "codiPhotos": jsonEncode(this.codiPhotos),
      "items": jsonEncode(this.items),
    };
  }
}

class CodiPhotos {
  final String? photoName;
  final String? photoBase64;
  final bool isMainPhoto;
  final String? type;

  const CodiPhotos({
    required this.photoName,
    required this.photoBase64,
    required this.isMainPhoto,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      "photoName": this.photoName,
      "photoBase64": this.photoBase64,
      "isMainPhoto": this.isMainPhoto,
      "type": this.type,
    };
  }
}

class Items {
  final int brandId;
  final int itemsId;

  const Items({
    required this.brandId,
    required this.itemsId,
  });

  Map<String, dynamic> toJson() {
    return {
      "brandId": this.brandId,
      "itemsId": this.itemsId,
    };
  }
}
