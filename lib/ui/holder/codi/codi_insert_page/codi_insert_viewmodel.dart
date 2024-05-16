import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class CodiInsertModel {
  final List<XFile> images;
  final String prevImg;
  final String? itemImg;

  CodiInsertModel({
    required this.prevImg,
    required this.images,
    this.itemImg,
  });

  CodiInsertModel copyWith({
    List<XFile>? images,
    String? prevImg,
    String? itemImg,
  }) {
    return CodiInsertModel(
      images: images ?? this.images,
      prevImg: prevImg ?? this.prevImg,
      itemImg: itemImg ?? this.itemImg,
    );
  }
}

class CodiInsertViewModel extends StateNotifier<CodiInsertModel> {
  final ImagePicker picker = ImagePicker();
  final cacheManager = DefaultCacheManager();

  CodiInsertViewModel() : super(CodiInsertModel(prevImg: '', images: []));


  Future<void> pickAndAddImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      String base64String = await convertToBase64(image);
      await cacheManager.putFile(
        image.path,
        await image.readAsBytes(),
        fileExtension: 'jpg',
      );
      state = state
          .copyWith(images: [...state.images, image], prevImg: base64String);
    }
  }

  Future<void> pickAndAddImageFromBase64(String base64String) async {
    final mimeType = _getMimeType(base64String);
    final imageBytes = base64Decode(base64String.split(',').last);
    final image = XFile.fromData(imageBytes, mimeType: mimeType, name: 'image.${mimeType.split('/').last}');
    state = state.copyWith(images: [...state.images, image], prevImg: base64String);
  }

  String _getMimeType(String base64String) {
    final regex = RegExp(r'data:(.*?);base64');
    final match = regex.firstMatch(base64String);
    if (match != null && match.groupCount == 1) {
      return match.group(1)!;
    }
    return 'image/jpeg'; // 기본값
  }

  Future<String> convertToBase64(XFile image) async {
    Uint8List imageBytes = await image.readAsBytes();
    return compute(base64Encode, imageBytes);
  }

  void setMainImg(String pushImages) {
    state = state.copyWith(prevImg: pushImages);
  }

  void removeImage(int index) {
    List<XFile> updatedImages = List.from(state.images)..removeAt(index);
    state = state.copyWith(images: updatedImages);
  }



}

final codiInsertProvider =
    StateNotifierProvider<CodiInsertViewModel, CodiInsertModel>(
  (ref) => CodiInsertViewModel(),
);
