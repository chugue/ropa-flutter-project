import 'package:final_project_team02/data/repositoreis/inquiry.dart';

void main() async {
  await callInquiriesList_test();
}

final accessToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6dHJ1ZSwibmFtZSI6IuuzgOyasOyEnSIsImlkIjozLCJleHAiOjE3MTYwMTU2MzUsImVtYWlsIjoidXNlcjNAZXhhbXBsZS5jb20ifQ.d5adwjyo2CnBpaW05v7cnw0qVRFOThRtEmH1p5EyMGIeDhZbx-BiTmaVQufo-0SNh7I_aGSfdDlTJPQq817lAg';

Future<void> callInquiriesList_test() async {
  await InquiryRepo().callInquiriesListTest(accessToken);
}
