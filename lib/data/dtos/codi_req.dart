class CodiInsertReqDTO {
  final int userId;
  final String? description;
  final List<CodiPhots> codiPhotos;
  final List<Items> items;

  const CodiInsertReqDTO({
    required this.userId,
    required this.description,
    required this.codiPhotos,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      "userId": this.userId,
      "description": this.description,
      "codiPhotos": codiPhotos.map((photo) => photo.toJson()).toList(),
      "items": items.map((item) => item.toJson()).toList(),
    };
  }
}

class CodiPhots {
  final String? photoName;
  final String? photoBase64;
  final String? type;
  final bool isMainPhoto;

  const CodiPhots({
    required this.photoName,
    required this.photoBase64,
    required this.type,
    required this.isMainPhoto,
  });

  Map<String, dynamic> toJson() {
    return {
      "photoName": this.photoName,
      "photoBase64": this.photoBase64,
      "type": this.type,
      "isMainPhoto": this.isMainPhoto,
    };
  }
}

class Items {
  final int? brandId;
  final int? itemsId;

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
