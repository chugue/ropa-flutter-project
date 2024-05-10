import 'package:final_project_team02/data/repositoreis/inquiries_repo.dart';

void main() async {
  await callInquiriesList_test();
}

final String globalAccessToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6dHJ1ZSwibmFtZSI6IuyCrOyaqeyekDHsnZgg7Iuk66qFIiwiaWQiOjEsImV4cCI6MTcxNTM5MzU3NywiZW1haWwiOiJ1c2VyMUBleGFtcGxlLmNvbSJ9.TnmHLRcnSkzJR-7ZeKhInA02jIs7YIkOXcEMSNg6JdvVYkgQ56H2ZVc5tzqZsLgvhqAH7e6fwleNwg7tIsHSAA';

Future<void> callInquiriesList_test() async {
  await InquiriesRepo().callInquiriesList();
}
