import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_code_challenge01/constants/gaps.dart';
import 'package:tiktok_code_challenge01/constants/sizes.dart';
import 'package:tiktok_code_challenge01/features/users/widget/display_user_info.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Eva'),
            actions: [
              IconButton(
                highlightColor: Colors.transparent,
                onPressed: () {},
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
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
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
                Container(
                  decoration: BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide(
                              color: Colors.grey.shade200, width: 1))),
                  child: TabBar(
                    splashFactory: NoSplash.splashFactory,
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: EdgeInsets.symmetric(
                      vertical: Sizes.size10,
                    ),
                    tabs: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size20),
                        child: Icon(
                          Icons.grid_4x4_rounded,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size20),
                        child: FaIcon(FontAwesomeIcons.heart),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    children: [
                      GridView.builder(
                        itemCount: 20,
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        padding: EdgeInsets.symmetric(horizontal: Sizes.size8),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: Sizes.size8,
                          mainAxisSpacing: Sizes.size8,
                          childAspectRatio: 9 / 21,
                        ),
                        itemBuilder: (context, index) => Column(
                          children: [
                            Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Sizes.size4),
                              ),
                              child: AspectRatio(
                                aspectRatio: 9 / 16,
                                child: FadeInImage.assetNetwork(
                                    fit: BoxFit.cover,
                                    placeholder:
                                        'assets/images/placeholder.jpg',
                                    image:
                                        'https://plus.unsplash.com/premium_photo-1677545183884-421157b2da02?q=80&w=2944&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                              ),
                            ),
                            Gaps.v10,
                            Text(
                              '이건 매우 긴 캡션입니다. 저는 고양이를 사랑해요.. 특히 제 고양이를요..',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Gaps.v5,
                            DefaultTextStyle(
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w600,
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundImage: NetworkImage(
                                        'https://avatars.githubusercontent.com/u/89173923?v=4'),
                                  ),
                                  Gaps.h4,
                                  Expanded(
                                      child: Text(
                                    'EvacebaChaChaGhiciGhichiYaya',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  FaIcon(
                                    FontAwesomeIcons.heart,
                                    size: Sizes.size16,
                                    color: Colors.grey.shade600,
                                  ),
                                  Gaps.h2,
                                  const Text(
                                    "2.5M",
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Text('냐옹'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
