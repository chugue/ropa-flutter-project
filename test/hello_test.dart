import 'package:final_project_team02/data/repositoreis/hello_repo.dart';

void main() async {
  await hello_test();
}

Future<void> hello_test() async {
  await HelloRepo().hello();
}
