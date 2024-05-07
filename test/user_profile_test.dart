import 'package:final_project_team02/data/repositoreis/user_profile_repository.dart';

void main() async {
  await user_profile_test();
}

Future<void> user_profile_test() async {
  await UserProfileRepository().fetchUserProfile(1, "asd");
}
