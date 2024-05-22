import 'package:final_project_team02/data/dtos/cart_req.dart';
import 'package:final_project_team02/data/repositoreis/cart_repo.dart';

final accessToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6dHJ1ZSwibmFtZSI6IuuzgOyasOyEnSIsImlkIjozLCJleHAiOjE3MTYwMDE3OTUsImVtYWlsIjoiYnVud3VzZW9rQGV4YW1wbGUuY29tIn0.gYKJupfTVouM8eUw3EaE9_sCP_R1MmHb_kfpQx-v6s8f2OeO-pabgAHxdOCKq1K4T6rCESy1d09sN2xl7b04Zg';

void main() async {
  await callCartSave_test();
}

Future<void> callCartSave_test() async {
  CartSaveDTO reqDTO = CartSaveDTO(itemId: 1, quantity: 1, codiId: 1);
  await CartRepo().callCartSave(reqDTO);
}

Future<void> callCartList_test() async {
  await CartRepo().callCartList();
}
