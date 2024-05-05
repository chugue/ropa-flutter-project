import 'package:final_project_team02/ui/holder/main_viewmodel.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/user_my_page.dart';
import 'package:final_project_team02/ui/holder/home/home_page.dart';
import 'package:final_project_team02/ui/holder/serach/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home/home_page.dart';
import 'my_page/pages/user/user_my_page.dart';

class MainHolder extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MainHolderModel? model = ref.watch(mainHolderProvider);

    return Scaffold(
      body: IndexedStack(
        index: model!.selectedIndexId,
        children: [HomePage(), SearchPage(), UserMyPage()],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, model, ref),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(
      BuildContext context, MainHolderModel model, WidgetRef ref) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      //글자를 없애고 가운데로 배치한다.

      showUnselectedLabels: false,
      //선택이 될때 글자가 보인다.

      backgroundColor: Colors.white,
      //선택된 아이콘에 색상 보여ㅈ기

      selectedItemColor: Colors.black,
      //클릭시 아이콘 색상

      unselectedItemColor: Colors.grey.shade400,
      //아이콘 색상

      currentIndex: model!.selectedIndexId,
      onTap: (i) => {
        // 선택된 인덱스를 모델에 업데이트
        ref.read(mainHolderProvider.notifier).state =
            MainHolderModel(selectedIndexId: i)
      },

      items: [
        BottomNavigationBarItem(label: 'ㅁ', icon: Icon(CupertinoIcons.home)),
        BottomNavigationBarItem(label: 'ㅁ', icon: Icon(CupertinoIcons.search)),
        BottomNavigationBarItem(
            label: 'ㅁ', icon: Icon(CupertinoIcons.person_fill)),
        // BottomNavigationBarItem(
        //     label: '', icon: Icon(CupertinoIcons.person_fill)),
      ],
    );
  }
}
