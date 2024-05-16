// import 'package:final_project_team02/_core/constants/theme.dart';
// import 'package:final_project_team02/ui/holder/inquiry/inquiry_page/inquiry_page.dart';
// import 'package:final_project_team02/ui/holder/my_page/_components/my_page_custom_button.dart';
// import 'package:final_project_team02/ui/holder/my_page/pages/user/components/my_page_order_inquiry.dart';
// import 'package:final_project_team02/ui/holder/my_page/pages/user/user_my_pageviewmodel.dart';
// import 'package:flutter/material.dart';
//
// class UserMyPageBodyTop extends StatelessWidget {
//   final UserMyPageModel model;
//
//   UserMyPageBodyTop({
//     required this.model,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         children: [
//           SizedBox(height: 30),
//           // ✅ 사용자 닉네임
//           _buildUserPic(),
//           SizedBox(height: 20),
//
//           MyPageCustomButton(title: "프로필 설정"),
//           SizedBox(height: 20),
//           MyPageOrderInquiry(orderId: 10),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildUserPic() {
//     return Row(
//       children: [
//         SizedBox(
//           width: 65,
//           height: 65,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(32.5),
//             child: Image.network(
//               'https://picsum.photos/200/100', // :TODO 04 사진수정
//               // Image.memory(base64Decode(model),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         SizedBox(width: 16),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("아직!!", style: textTheme().displayMedium),
//             // :TODO 04수정
//             Text(model.userMyPage.nickName, style: textTheme().displayMedium),
//             // :TODO 04수정
//           ],
//         ),
//       ],
//     );
//   }
// }
//
// class InquiryButton extends StatelessWidget {
//   const InquiryButton({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 10.0),
//       width: double.infinity,
//       height: 40,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => InquiryPage(),
//                 ),
//               );
//             },
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "1대1 문의하기",
//                   style: TextStyle(color: Colors.black, fontSize: 16.0),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
