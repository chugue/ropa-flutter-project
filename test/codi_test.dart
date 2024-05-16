import 'package:final_project_team02/data/repositoreis/codi_repo.dart';

final accessToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6dHJ1ZSwibmFtZSI6IuuzgOyasOyEnSIsImlkIjozLCJleHAiOjE3MTU5MTQ3MTgsImVtYWlsIjoiYnVud3VzZW9rQGV4YW1wbGUuY29tIn0.1YrvkNaE5KG_6HkaGoTOrOMn4F8LGtgmxIhxBQsOxq9dcXHHGGeppmty3aebWLsJdMHjuSnDu90tarCFK_eodw';

void main() async {
  await callItemInsert_test();
}

Future<void> callItemInsert_test() async {
  await CodiRepo().callGetItemInsert(null);
}

Future<void> callLoveCount_test() async {
  await CodiRepo().callSaveLoveCount(1);
}

Future<void> callCodiDetail_test() async {
  await CodiRepo().callCodiDetail(1);
}
