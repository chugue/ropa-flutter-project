import 'package:final_project_team02/data/repositoreis/inquiries_repo.dart';

void main() async {
  await callInquiriesList2_test();
}

final accessToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6dHJ1ZSwibmFtZSI6IuyCrOyaqeyekDHsnZgg7Iuk66qFIiwiaWQiOjEsImV4cCI6MTcxNTMyMjMwMCwiZW1haWwiOiJ1c2VyMUBleGFtcGxlLmNvbSJ9.t-a_L0q8u_P9hsvnx5hnTpyr1585O54A-p869ZPQ3zLzOWjclRyJk9wCoTRGnRyIBffs0LCjgEzJOiame2jmyA';

Future<void> callInquiriesList_test() async {
  await InquiriesRepo().callInquiriesList(accessToken);
}

Future<void> callInquiriesList2_test() async {
  await InquiriesRepo().callInquiriesListv2();
}
