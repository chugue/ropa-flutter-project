import 'package:flutter/material.dart';

import '../../components/custom_app_bar.dart';
import '../../theme.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(micon: Icons.home),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              _buildProfilePic(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Column(
                    children: [
                      Text('어깨 넓은 보통 체형', style: textTheme().headlineSmall),
                      Text('어깨 넓은 보통 체형', style: textTheme().headlineSmall),
                      Text('어깨 넓은 보통 체형', style: textTheme().headlineSmall),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildProfileButton(),
              const SizedBox(height: 20),
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      tabs: [
                        Tab(
                          icon: Icon(Icons.grid_on),
                        ),
                        Tab(
                          icon: Icon(Icons.meeting_room),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    TabBarView(
                      children: [
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 2,
                            crossAxisCount: 1,
                            mainAxisSpacing: 2,
                          ),
                          itemCount: 42,
                          itemBuilder: (context, index) {
                            return AspectRatio(
                              aspectRatio: 2 / 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                    "https://picsum.photos/id/${index + 1}/400/400",
                                    fit: BoxFit.cover),
                              ),
                            );
                          },
                        ),
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 2,
                            crossAxisCount: 1,
                            mainAxisSpacing: 2,
                          ),
                          itemCount: 42,
                          itemBuilder: (context, index) {
                            return AspectRatio(
                              aspectRatio: 2 / 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                    "https://picsum.photos/id/${index + 1}/400/400",
                                    fit: BoxFit.cover),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePic() {
    return Row(
      children: [
        SizedBox(
          width: 65,
          height: 65,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32.5),
            child: Image.network(
              'https://picsum.photos/200/100', // :TODO 04 사진수정
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('회원 이름', style: textTheme().displayMedium), // :TODO 04수정
            Text('180cm • 70kg • 직장인',
                style: textTheme().bodyMedium), // :TODO 04수정
          ],
        ),
      ],
    );
  }

  Widget _buildProfileButton() {
    return InkWell(
      hoverColor: Colors.black,
      onTap: () {},
      child: Container(
        width: 400,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(),
        ),
        child: Align(
          child: Text(
            '프로필 설정', // :TODO 04수정 (오타)
            style: textTheme().titleMedium, // :TODO 04수정
          ),
        ),
      ),
    );
  }
}
