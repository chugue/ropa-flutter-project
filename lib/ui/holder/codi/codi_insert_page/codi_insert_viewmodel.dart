
import 'dart:convert';
import 'dart:typed_data';

import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class CodiInsertModel {
  List<String> imagesBase64; // List to store images as Base64 strings
  List<XFile> imageFiles;

  CodiInsertModel({
    required this.imagesBase64,
    // required this.XFile,
    required this.imageFiles,
  });
// List to store XFile references



}

class CodiInsertViewModel extends StateNotifier<CodiInsertModel?> {
  // Ref ref;
  // SessionData sessionData;
  final mContext = navigatorKey.currentContext;
  final ImagePicker picker = ImagePicker();

  CodiInsertViewModel(super.state); //ImagePicker 초기화

  Future<void> pickAndAddImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    Logger().d("❤️❤️❤️❤️❤️❤️❤️${image}");

    if (image != null) {
      String base64String = await convertToBase64(image);
      Logger().d("❤️❤️❤️❤️❤️❤️❤️${base64String}");


      if (state! != null) {
        this.state = CodiInsertModel(
            imagesBase64: List.from(state!.imagesBase64)..add(base64String),
            imageFiles: List.from(state!.imageFiles)..add(image)
        );
      } else {
        print("State is null, initializing new state");
        state = CodiInsertModel(imagesBase64: [base64String], imageFiles: [image]);
      }
      print("object");
      Logger().d("❤️❤️❤️❤️❤️❤️❤️${state!.imagesBase64}, ${state!.imageFiles}");
    }
  }

  Future<String> convertToBase64(XFile image) async {
    Uint8List imageBytes = await image.readAsBytes();
    return compute(base64Encode, imageBytes);
  }

  Future<void> handleImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      String base64String = await convertToBase64(image);

    }
  }

  // void getImage(XFile  imageSource) async {
  //   if (imageSource != null) {
  //     state!._image = imageSource;
  //     Logger().d("😁😁😁😁😁😁😁😁${state!._image}");
  //     String pushImage = await convertToBase64(imageSource);
  //     print("$pushImage");
  //
  //   }
  // }

  // void setMainImg(List<String> pushImages) {
  //   // Since pushImages is directly a List<String>, you can assign it directly to the state.
  //   // There's no need for a map operation unless you're transforming the data.
  //   state = CodiInsertModel(prevImg: List.from(pushImages)); // Creating a copy of the list for immutability
  // }
}

final codidInsertProvider =
StateNotifierProvider<CodiInsertViewModel, CodiInsertModel?>(
        (ref) {
      SessionData sessionData = ref.read(sessionProvider);
      return CodiInsertViewModel(null)..pickAndAddImage();
    });
