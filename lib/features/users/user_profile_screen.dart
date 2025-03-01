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
    return CustomScrollView(
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
