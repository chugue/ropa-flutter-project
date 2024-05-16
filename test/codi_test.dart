import 'package:final_project_team02/data/repositoreis/codi_repo.dart';

final accessToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6dHJ1ZSwibmFtZSI6IuuzgOyasOyEnSIsImlkIjozLCJleHAiOjE3MTU5MzU3OTYsImVtYWlsIjoiYnVud3VzZW9rQGV4YW1wbGUuY29tIn0.Vm8RMgZS4AZDpLHe07SABMVsAb-rlb4xlTQ5JQXbwQKa_-UPItbZnTs9EW64pY49XvssSFi1uWDtjsQAPFf5jg';

void main() async {
  await callItemInsert_test();
}

Future<void> callItemInsert_test() async {
  await CodiRepo().callGetItemInsert('top');
}

Future<void> callLoveCount_test() async {
  await CodiRepo().callSaveLoveCount(1);
}

Future<void> callCodiDetail_test() async {
  await CodiRepo().callCodiDetail(1);
}
