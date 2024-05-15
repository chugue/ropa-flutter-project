import 'package:final_project_team02/data/repositoreis/order_repo.dart';

final accessToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6ZmFsc2UsIm5hbWUiOiLsgqzsmqnsnpAx7J2YIOyLpOuqhSIsImlkIjoxLCJleHAiOjE3MTU3NDM5NzUsImVtYWlsIjoidXNlcjFAZXhhbXBsZS5jb20ifQ.AbsQvvk5y6bzDEJ9fe0UfsZPjDJAYb0bI46cd80XE75wgIi3lmYZ9lqE1ecobgHv718TFuRAIi4BPiPolVp_Lw';

void main() async {
  await callOrderList_test();
}

Future<void> callOrderList_test() async {
  await OrderRepo().callOrderHistoryList();
}
