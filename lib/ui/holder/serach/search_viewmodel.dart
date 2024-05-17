import 'package:final_project_team02/data/session_data/session_data.dart'; // 세션 데이터를 포함하는 클래스 임포트
import 'package:final_project_team02/main.dart'; // 메인 파일을 임포트하여 navigatorKey를 사용
import 'package:final_project_team02/ui/holder/serach/search_data/codi_photo.dart'; // 코디 사진 데이터를 포함하는 클래스 임포트
import 'package:final_project_team02/ui/holder/serach/search_data/item_photo.dart'; // 아이템 사진 데이터를 포함하는 클래스 임포트
import 'package:flutter/material.dart'; // Flutter의 기본 위젯 라이브러리 임포트
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Riverpod 상태 관리 라이브러리 임포트
import 'package:logger/logger.dart';

import '../../../data/repositoreis/search_repo.dart'; // 검색 데이터 요청을 처리하는 리포지토리 클래스 임포트

// SearchModel 클래스 정의
class SearchModel {
  final List<CodiPhoto> codiPhotos; // 코디 사진 목록
  final List<ItemPhoto> itemPhotos; // 아이템 사진 목록

  // SearchModel 생성자
  const SearchModel({
    required this.codiPhotos, // 코디 사진 목록을 초기화
    required this.itemPhotos, // 아이템 사진 목록을 초기화
  });
}

// SearchViewModel 클래스 정의
class SearchViewmodel extends StateNotifier<SearchModel?> {
  final BuildContext? mContext; // 현재 네비게이션 컨텍스트를 가져옴
  final SessionData sessionData; // 세션 데이터 인스턴스
  final SearchRepo searchRepo; // SearchRepo 인스턴스

  SearchViewmodel(this.sessionData)
      : mContext = navigatorKey.currentContext,
        searchRepo = SearchRepo(),
        super(null);

  // // SearchViewmodel 생성자
  // SearchViewmodel(super.state, this.sessionData)
  //     : searchRepo = SearchRepo(); // 초기화 리스트를 사용하여 부모 클래스의 상태 초기화 및 searchRepo 인스턴스화

  // notifyInit 메소드 정의: 초기화 과정에서 데이터 가져오기
  Future<void> notifyInit() async {
    try {
      // SearchRepo를 사용하여 데이터 가져오기
      final searchData =
          await searchRepo.callSearchData(); // API 호출을 통해 데이터를 가져옴
      Logger().d(searchData);
      state = searchData; // 가져온 데이터를 state에 설정하여 상태 업데이트
    } catch (e) {
      // 예외 처리
      if (mContext != null) {
        // mContext가 null이 아닌지 확인
        ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text('Error: $e')), // 에러 메시지를 스낵바로 표시
        );
      }
    }
  }
}

// StateNotifierProvider 정의: SearchViewmodel 인스턴스를 제공
final searchProvider =
    StateNotifierProvider<SearchViewmodel, SearchModel?>((ref) {
  SessionData sessionData = SessionData(); // 새로운 세션 데이터 인스턴스를 생성
  final viewModel = SearchViewmodel(sessionData);
  viewModel.notifyInit(); // SearchViewmodel 인스턴스를 생성하고 notifyInit 메소드를 호출하여 초기화
  return viewModel; // SearchViewmodel 인스턴스를 생성하고 notifyInit 메소드를 호출하여 초기화
});
