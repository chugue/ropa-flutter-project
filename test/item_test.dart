import 'package:final_project_team02/data/repositoreis/inquiries_repo.dart';
import 'package:final_project_team02/data/repositoreis/item_repo.dart';

void main() async {
  await callItemDetail_test();
}

final accessToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6dHJ1ZSwibmFtZSI6IuyCrOyaqeyekDHsnZgg7Iuk66qFIiwiaWQiOjEsImV4cCI6MTcxNTQxMDAyOSwiZW1haWwiOiJ1c2VyMUBleGFtcGxlLmNvbSJ9.zvld6CXCKUPfgZNfpBKSVDfS0G72tlf_fnFLKsxHpzq0ogjc_jEO2HlvVpTmjCn2O3CPBTPYze6ztsRGR2k6Lg';

Future<void> callItemDetail_test() async {
  await ItemRepo().callItemDetail(accessToken);
}

Future<void> callInquiriesList2_test() async {
  await InquiriesRepo().callInquiriesListv2();
}
