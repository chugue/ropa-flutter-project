import 'package:final_project_team02/data/repositoreis/user_profile_repository.dart';

void main() async {
  await user_profile_test();
}

Future<void> user_profile_test() async {
  await UserProfileRepository().fetchUserProfile(
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6dHJ1ZSwibmFtZSI6IuyCrOyaqeyekDHsnZgg7Iuk66qFIiwiaWQiOjEsImV4cCI6MTcxNTE1MDYwNywiZW1haWwiOiJ1c2VyMUBleGFtcGxlLmNvbSJ9.hJ-pyxYjVTQDaJcnsSYRQf6NO_04EtIsxjIv49d6usIiVB0af8I85z9hWaSKqHy9nhy2hk3IxPuJ2hrJTCcfsw");
}
