import 'package:final_project_team02/data/repositoreis/codi_repo.dart';

void main() async {
  await callCodiDetail_test();
}

final accessToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6dHJ1ZSwibmFtZSI6IuyCrOyaqeyekDHsnZgg7Iuk66qFIiwiaWQiOjEsImV4cCI6MTcxNTIzMTc4NCwiZW1haWwiOiJ1c2VyMUBleGFtcGxlLmNvbSJ9.OwPmgGXUSXFRDNqSWCywuH6tEz6QwF_p2Vy1jNAUaHLfEN75Nei31-kICT29krZqem6UiyJpfHX8P_68GD1idA';

Future<void> callCodiDetail_test() async {
  await CodiRepository().callCodiDetail(1);
}
