import 'package:flutter/material.dart';

import '_choose_address.dart';
import '_input_address.dart';

class AddressTab extends StatefulWidget {
  const AddressTab({Key? key}) : super(key: key);

  @override
  State<AddressTab> createState() => _AddressTabState();
}

class _AddressTabState extends State<AddressTab>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: 500,
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            _buildTabBar(),
            Expanded(child: _buildTabBarView()),
          ],
        ),
      ),
    );
  }

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  Widget _buildTabBar() {
    return TabBar(
      labelPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.black12, width: 0.5),
          left: BorderSide(color: Colors.black12, width: 0.5),
          right: BorderSide(color: Colors.black12, width: 0.5),
        ),
      ),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black38,
      controller: _tabController,
      tabs: [
        Tab(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Text(
                "최근 배송지",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Tab(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Text(
                "직접입력",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        Container(
          color: Colors.white,
        ),
        Container(
          color: Colors.white,
          child: Column(
            children: [
              ChooseAddress(),
              InputAddress(),
              SizedBox(height: 10),
              Divider(color: Colors.black12),
            ],
          ),
        ),
      ],
    );
  }
}
//
// DropDownMessages(),
//
// class DropDownMessages extends StatefulWidget {
//   const DropDownMessages({super.key});
//
//   @override
//   State<DropDownMessages> createState() => _DropDownMessagesState();
// }
//
// class _DropDownMessagesState extends State<DropDownMessages> {
//   final List<String> list = <String>[
//     '-- 메시지 선택 (선택사항) --',
//     '배송 전에 미리 연락바랍니다.',
//     '부재 시 경비실에 맡겨주세요.',
//     '부재 시 문 앞에 놓아주세요.',
//     '빠른 배송 부탁드립니다.',
//     '택배함에 보관해 주세요.'
//   ];
//   String? dropdownValue;
//
//   @override
//   void initState() {
//     super.initState();
//     dropdownValue = list.first;
//   }
//
//   void _showModal() {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           color: Colors.white,
//           height: 400,
//           child: ListView.builder(
//             itemCount: list.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: ListTile(
//                       title: Text(list[index]),
//                       onTap: () {
//                         setState(() {
//                           dropdownValue = list[index];
//                         });
//                         Navigator.pop(context);
//                       },
//                     ),
//                   ),
//                   Divider(height: 1),
//                 ],
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Expanded(
//         child: Container(
//           height: 40,
//           child: GestureDetector(
//             onTap: _showModal,
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 border: Border.all(color: Colors.black38),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       maxLines: 1,
//                       dropdownValue ?? list.first,
//                       style: TextStyle(fontSize: 15, color: Colors.black87),
//                     ),
//                   ),
//                   Icon(Ionicons.chevron_down_outline, size: 16),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
