import 'package:final_project_team02/data/repositoreis/item_repo.dart';

void main() async {
  await callItemDetailList_test();
}

final accessToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6dHJ1ZSwibmFtZSI6IuyCrOyaqeyekDHsnZgg7Iuk66qFIiwiaWQiOjEsImV4cCI6MTcxNTUwNDc5OSwiZW1haWwiOiJ1c2VyMUBleGFtcGxlLmNvbSJ9.m6JYBUCiVYQyWYLbfZZbrQQfdSIjbIkkUVYbqCACbnD8XQdCH0nf-52xFfaE4UkWrmMVbisJUlsnMxGKICzUag';

Future<void> callItemDetailList_test() async {
  await ItemRepo().callItemDetailList(1);
}
