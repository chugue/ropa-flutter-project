import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

final baseURL = "http://192.168.0.59:8080";

final dio = Dio(
  BaseOptions(
    baseUrl: baseURL,
    contentType: "application/json; charset=utf-8",
    validateStatus: (status) => true,
  ),
);

const secureStorage = FlutterSecureStorage();
var logger = Logger();

// 인터셉터 생성
var interceptor = InterceptorsWrapper(
  onRequest: (options, handler) async {
    var accessToken;
    try {
      accessToken = await secureStorage.read(key: 'accessToken');
    } catch (e) {
      print("토큰 없음");
    }

    print("onRequest 토큰: $accessToken");

    if (accessToken != null) {
      options.headers["Authorization"] = "Bearer $accessToken";
    } else {
      print("나 토큰이 없어");
    }

    logger.d("리퀘스트 헤더: ${options.headers}"); // 이 위치로 변경
    return handler.next(options);
  },
  onResponse: (response, handler) async {
    var authorizationHeader = response.headers["Authorization"];
    if (authorizationHeader != null) {
      var accessToken = authorizationHeader[0].split("Bearer ")[1];
      print("onResponse 토큰: " + accessToken);
      await secureStorage.write(key: "accessToken", value: accessToken);
    }
    return handler.next(response);
  },
  onError: (error, handler) {
    //요청, 응답 오류일
    return handler.next(error);
  },
);
