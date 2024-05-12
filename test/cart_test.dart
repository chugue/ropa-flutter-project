
import 'package:final_project_team02/data/repositoreis/cart_repo.dart';

final accessToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6dHJ1ZSwibmFtZSI6IuyCrOyaqeyekDHsnZgg7Iuk66qFIiwiaWQiOjEsImV4cCI6MTcxNTU3ODA1OCwiZW1haWwiOiJ1c2VyMUBleGFtcGxlLmNvbSJ9.XMGSd18dilCYxvwLUR6lMTyan_yX2ewxIddZTUr_lKwNGkzlH191UTqoLn8b687p6Yfc_XlUSc9c4cbjAuxAag';

void main() async {
  await callCartList_test();
}

Future<void> callCartList_test() async {
  await CartRepo().callCartList();
}
