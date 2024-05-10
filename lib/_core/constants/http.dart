import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

// 192.168.219.111
//
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

String? globalAccessToken = null;

// 인터셉터 생성
var interceptor = InterceptorsWrapper(
  onRequest: (options, handler) async {
    if (globalAccessToken != null) {
      options.headers["Authorization"] = "Bearer $globalAccessToken";
    } else {
      print("나 토큰이 없어 🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️서버 확인해 봤어?🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️");
    }

    logger.d("리퀘스트 헤더: ${options.headers}"); // 이 위치로 변경
    return handler.next(options);
  },
  onResponse: (response, handler) async {
    logger.d(response.headers["Authorization"]);

    return handler.next(response);
  },
  onError: (error, handler) {
    //요청, 응답 오류일
    return handler.next(error);
  },
);
