import 'package:final_project_team02/data/repositoreis/buy_repo.dart';

final accessToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6dHJ1ZSwibmFtZSI6IuyCrOyaqeyekDHsnZgg7Iuk66qFIiwiaWQiOjEsImV4cCI6MTcxNTY3MTk5NCwiZW1haWwiOiJ1c2VyMUBleGFtcGxlLmNvbSJ9.1RnYFrIsghzIDfSlA1_kTaOnOBhR6jFPFz7JD7wN7AGOP5gDLTsNecGu-JWDL3P0odrV1Zo_7xG_nWn3wryQUw';

void main() async {
  await callBuyDetail_test();
}

Future<void> callBuyDetail_test() async {
  await BuyRepo().callBuyDetail();
}
