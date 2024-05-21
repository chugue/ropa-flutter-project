import 'package:image_picker/image_picker.dart';

class CodiInsertModel {
  final List<XFile> images;
  final String prevImg;
  final String? fileName;
  final String? fileExtension;
  final bool? isMainPhoto;

  final int? topItemId;
  final int? topBrandId;
  final String? topPhotoPath;
  final int? topImageId;
  final String? topItemName;

  final int? bottomItemId;
  final int? bottomBrandId;
  final String? bottomPhotoPath;
  final int? bottomImageId;
  final String? bottomItemName;
  final String comment;

  const CodiInsertModel({
    required this.images,
    required this.prevImg,
    this.fileName,
    this.fileExtension,
    this.isMainPhoto,
    this.topItemId,
    this.topBrandId,
    this.topPhotoPath,
    this.topImageId,
    this.topItemName,
    this.bottomItemId,
    this.bottomBrandId,
    this.bottomPhotoPath,
    this.bottomImageId,
    this.bottomItemName,
    required this.comment,
  });

  CodiInsertModel copyWith({
    List<XFile>? images,
    String? prevImg,
    String? fileName,
    String? fileExtension,
    bool? isMainPhoto,
    int? topItemId,
    int? topBrandId,
    String? topPhotoPath,
    int? topImageId,
    String? topItemName,
    int? bottomItemId,
    int? bottomBrandId,
    String? bottomPhotoPath,
    int? bottomImageId,
    String? bottomItemName,
    String? comment,
  }) {
    return CodiInsertModel(
      images: images ?? this.images,
      prevImg: prevImg ?? this.prevImg,
      fileName: fileName ?? this.fileName,
      fileExtension: fileExtension ?? this.fileExtension,
      isMainPhoto: isMainPhoto ?? this.isMainPhoto,
      topItemId: topItemId ?? this.topItemId,
      topBrandId: topBrandId ?? this.topBrandId,
      topPhotoPath: topPhotoPath ?? this.topPhotoPath,
      topImageId: topImageId ?? this.topImageId,
      topItemName: topItemName ?? this.topItemName,
      bottomItemId: bottomItemId ?? this.bottomItemId,
      bottomBrandId: bottomBrandId ?? this.bottomBrandId,
      bottomPhotoPath: bottomPhotoPath ?? this.bottomPhotoPath,
      bottomImageId: bottomImageId ?? this.bottomImageId,
      bottomItemName: bottomItemName ?? this.bottomItemName,
      comment: comment ?? this.comment,
    );
  }
}