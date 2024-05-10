import 'package:final_project_team02/data/repositoreis/codi_repo.dart';

void main() async {
  await callLoveCount_test();
}

Future<void> callLoveCount_test() async {
  await CodiRepo().callSaveLoveCount(1);
}

final accessToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6dHJ1ZSwibmFtZSI6IuyCrOyaqeyekDHsnZgg7Iuk66qFIiwiaWQiOjEsImV4cCI6MTcxNTMyMjMwMCwiZW1haWwiOiJ1c2VyMUBleGFtcGxlLmNvbSJ9.t-a_L0q8u_P9hsvnx5hnTpyr1585O54A-p869ZPQ3zLzOWjclRyJk9wCoTRGnRyIBffs0LCjgEzJOiame2jmyA';

Future<void> callCodiDetail_test() async {
  await CodiRepo().callCodiDetail(1);
}
