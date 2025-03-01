import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_code_challenge01/constants/gaps.dart';
import 'package:tiktok_code_challenge01/constants/sizes.dart';
import 'package:tiktok_code_challenge01/utils/utils.dart';

final tabs = [
  'Top',
  'Users',
  'Videos',
  'Sounds',
  'Live',
  'Shopping',
  'Brands',
];

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  void _onSearchChange(String value) {
    print(value);
    ;
  }

  void _onSubmit(String value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: CupertinoSearchTextField(
            onChanged: _onSearchChange,
            onSubmitted: _onSubmit,
          ),
          bottom: TabBar(
              onTap: (value) => Utils.focusout(context),
              labelColor: Colors.black,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size16,
              ),
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size16,
                color: Colors.grey,
              ),
              splashFactory: NoSplash.splashFactory,
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              tabAlignment: TabAlignment.center,
              isScrollable: true,
              indicatorColor: const Color.fromARGB(255, 24, 16, 16),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [for (var tab in tabs) Tab(text: tab)]),
        ),
        body: TabBarView(children: [
          GridView.builder(
              itemCount: 20,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                          borderRadius: BorderRadius.circular(Sizes.size4),
                        ),
                        child: AspectRatio(
                          aspectRatio: 9 / 16,
                          child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder: 'assets/images/placeholder.jpg',
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
                  )),
          for (var tab in tabs.skip(1))
            Center(
              child: Text(tab),
            ),
        ]),
      ),
    );
  }
}
