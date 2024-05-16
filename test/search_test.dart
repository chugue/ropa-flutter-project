import 'package:final_project_team02/data/repositoreis/buy_repo.dart';
import 'package:final_project_team02/data/repositoreis/search_repo.dart';

final accessToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6ZmFsc2UsIm5hbWUiOiLsoJXtlbTsnbgiLCJpZCI6MSwiZXhwIjoxNzE1OTE4MzgxLCJlbWFpbCI6Imp1bmdoZWluQGV4YW1wbGUuY29tIn0.D6ow3dxfMQ3Aysqx8qHGj30e3okock8Df_fF-ynBmq5pd5YpmeYvZVDeyhaSOSbnRXmf3xqE9BxUQMqsHzmQHA';

void main() async {
  await callSearchData_test();
}

Future<void> callSearchData_test() async {
  await SearchRepo().callSearchData();
}
