import 'package:image_picker/image_picker.dart';

class CodiInsertModel {
  final List<XFile> images;
  final List<String> prevImgs;
  final List<String?> fileNames;
  final List<String?> fileExtensions;
  final List<bool> isMainPhotos;
  final String? topPhotoPath;
  final String? bottomPhotoPath;
  final int? topBrandId;
  final int? topImageId;
  final int? topItemId;
  final int? bottomBrandId;
  final int? bottomItemId;
  final int? bottomImageId;
  final String comment;

  CodiInsertModel({
    this.images = const [],
    this.prevImgs = const [],
    this.fileNames = const [],
    this.fileExtensions = const [],
    this.isMainPhotos = const [],
    this.topPhotoPath,
    this.bottomPhotoPath,
    this.topBrandId,
    this.topItemId,
    this.topImageId,
    this.bottomBrandId,
    this.bottomItemId,
    this.bottomImageId,
    this.comment = '',
  });

  CodiInsertModel copyWith({
    List<XFile>? images,
    List<String>? prevImgs,
    List<String?>? fileNames,
    List<String?>? fileExtensions,
    List<bool>? isMainPhotos,
    String? topPhotoPath,
    String? bottomPhotoPath,
    int? topBrandId,
    int? topItemId,
    int? topImageId,
    int? bottomBrandId,
    int? bottomItemId,
    int? bottomImageId,
    String? comment,
  }) {
    return CodiInsertModel(
      images: images ?? this.images,
      prevImgs: prevImgs ?? this.prevImgs,
      fileNames: fileNames ?? this.fileNames,
      fileExtensions: fileExtensions ?? this.fileExtensions,
      isMainPhotos: isMainPhotos ?? this.isMainPhotos,
      topPhotoPath: topPhotoPath ?? this.topPhotoPath,
      bottomPhotoPath: bottomPhotoPath ?? this.bottomPhotoPath,
      topBrandId: topBrandId ?? this.topBrandId,
      topImageId: topImageId ?? this.topImageId,
      topItemId: topItemId ?? this.topItemId,
      bottomBrandId: bottomBrandId ?? this.bottomBrandId,
      bottomImageId: bottomImageId ?? this.bottomImageId,
      bottomItemId: bottomItemId ?? this.bottomItemId,
      comment: comment ?? this.comment,
    );
  }
}
