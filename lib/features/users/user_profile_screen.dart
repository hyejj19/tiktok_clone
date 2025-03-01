import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_code_challenge01/constants/gaps.dart';
import 'package:tiktok_code_challenge01/constants/sizes.dart';
import 'package:tiktok_code_challenge01/features/settings/setting_screen.dart';
import 'package:tiktok_code_challenge01/features/users/widget/display_user_info.dart';
import 'package:tiktok_code_challenge01/widgets/persistent_tab_bar.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text('Eva'),
                actions: [
                  IconButton(
                    highlightColor: Colors.transparent,
                    onPressed: () => _onGearPressed(context),
                    icon: FaIcon(
                      FontAwesomeIcons.gear,
                      size: Sizes.size20,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      foregroundImage: NetworkImage(
                          "https://avatars.githubusercontent.com/u/89173923?v=4"),
                      child: Text("Eva"),
                    ),
                    Gaps.v20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '@Eva',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size18,
                          ),
                        ),
                        Gaps.h6,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          size: Sizes.size18,
                          color: Colors.blue.shade500,
                        )
                      ],
                    ),
                    Gaps.v24,
                    SizedBox(
                      height: Sizes.size56,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DisplayUserInfo(
                            title: 'Followers',
                            value: "97",
                          ),
                          VerticalDivider(
                            width: Sizes.size32,
                            indent: Sizes.size12,
                            endIndent: Sizes.size12,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade400,
                          ),
                          DisplayUserInfo(
                            title: 'Following',
                            value: "10M",
                          ),
                          VerticalDivider(
                            width: Sizes.size32,
                            indent: Sizes.size12,
                            endIndent: Sizes.size12,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade400,
                          ),
                          DisplayUserInfo(
                            title: 'Likes',
                            value: "197.7M",
                          ),
                        ],
                      ),
                    ),
                    Gaps.v14,
                    FractionallySizedBox(
                      widthFactor: 0.33,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: Sizes.size12,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(
                            Sizes.size4,
                          ),
                        ),
                        child: Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Gaps.v14,
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Sizes.size32),
                      child: Text(
                        "I'm Software Engineer and currently learning Flutter.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gaps.v14,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: Sizes.size12,
                        ),
                        Gaps.h4,
                        Text(
                          "https://evalog.vercel.app",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: PersistentTabBar(),
              ),
            ];
          },
          body: TabBarView(
            children: [
              GridView.builder(
                itemCount: 20,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.symmetric(horizontal: Sizes.size8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: Sizes.size2,
                    mainAxisSpacing: Sizes.size2,
                    childAspectRatio: 3 / 4),
                itemBuilder: (context, index) => Column(
                  children: [
                    Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 3 / 4,
                          child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder: 'assets/images/placeholder.jpg',
                              image:
                                  'https://plus.unsplash.com/premium_photo-1677545183884-421157b2da02?q=80&w=2944&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                        ),
                        Positioned(
                          top: Sizes.size10,
                          left: Sizes.size10,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: Sizes.size6,
                              horizontal: Sizes.size8,
                            ),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(
                                  Sizes.size4,
                                )),
                            child: Text(
                              'Pinned',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: Sizes.size10,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: Sizes.size10,
                          left: Sizes.size10,
                          child: Row(
                            children: [
                              Text(
                                '4.1 M',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: Text('냐옹'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
