import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

final dio = Dio(
  BaseOptions(
    //자기 IP넣기
    baseUrl: "http://192.168.0.145:8080",
    contentType: "application/json; charset=utf-8",
    validateStatus: (status) => true,
  ),
);

const secureStorage = FlutterSecureStorage();

// 인터셉터 생성
var interceptor = InterceptorsWrapper(
  onRequest: (options, handler) async {
    //토큰을 secureStorage에서 읽는다.
    var accessToken = await secureStorage.read(key: 'accessToken');
    print("onRequest 토큰: $accessToken");

    if (accessToken != null) {
      options.headers["Authorization"] = "Bearer $accessToken";
    } else {
      print("나 토큰이 없어 🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️서버 확인해 봤어?🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️");
    }
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
    // 오류 정보를 로그로 남깁니다.
    Logger().e("오류 발생: ${error.message}");
    if (error.response != null) {
      // HTTP 응답 정보도 로그로 남길 수 있습니다.
      Logger().e("응답 데이터: ${error.response!.data}");
      Logger().e("응답 상태 코드: ${error.response!.statusCode}");
    }
    //요청, 응답 오류일때
    return handler.next(error);
  },
);
