import 'package:final_project_team02/data/repositoreis/home_repo.dart';

void main() async {
  await callHome_test();
}

Future<void> callHome_test() async {
  await HomeRepo().callHomeList();
}
