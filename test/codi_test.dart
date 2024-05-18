import 'package:final_project_team02/data/dtos/codi_req.dart';
import 'package:final_project_team02/data/repositoreis/codi_repo.dart';

final accessToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6dHJ1ZSwibmFtZSI6IuuzgOyasOyEnSIsImlkIjozLCJleHAiOjE3MTYwMzgxNjUsImVtYWlsIjoiYnVud3VzZW9rQGV4YW1wbGUuY29tIn0.YHCPp7vbSxlgfGhlovKVpp4y3WbsgVk2h9QncXYkUDOF-W6-AoDj_78TSaEkbJXgFjExliT6433Ef8x0HUQoEQ';

void main() async {
  await callSetItemInsert_test();
}

Future<void> callSetItemInsert_test() async {
  final dummyCodiPhotos = [
    CodiPhots(
      photoName: "코디사진1.jpg",
      photoBase64: "SGVsbG8sIFdvcmxkIQ==",
      type: "CODI",
      isMainPhoto: true,
    ),
    CodiPhots(
      photoName: "코디사진2.jpg",
      photoBase64: "SGVsbG8sIFdvcmxkIQ==",
      type: "CODI",
      isMainPhoto: false,
    ),
    CodiPhots(
      photoName: "코디사진3.jpg",
      photoBase64: "SGVsbG8sIFdvcmxkIQ==",
      type: "CODI",
      isMainPhoto: false,
    ),
  ];

  final dummyItems = [
    Items(
      brandId: 1,
      itemsId: 1,
    ),
    Items(
      brandId: 2,
      itemsId: 2,
    ),
    Items(
      brandId: 3,
      itemsId: 3,
    ),
  ];

  final dummyCodiInsertReqDTO = CodiInsertReqDTO(
    title: '코디1',
    userId: 1,
    description: "봄에 어울리는 화사한 코디입니다.",
    codiPhotos: dummyCodiPhotos,
    items: dummyItems,
  );
  await CodiRepo().callSetItemInsert(dummyCodiInsertReqDTO);
}
Future<void> callGetItemInsert_test() async {
  await CodiRepo().callGetItemInsert('top');
}

Future<void> callLoveCount_test() async {
  await CodiRepo().callSaveLoveCount(1);
}

Future<void> callCodiDetail_test() async {
  await CodiRepo().callCodiDetail(1);
}
