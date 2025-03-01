import 'package:flutter/material.dart';
import 'package:tiktok_code_challenge01/constants/sizes.dart';

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
          floating: true,
          backgroundColor: Colors.teal,
          collapsedHeight: 80,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              "assets/images/placeholder.jpg",
              fit: BoxFit.cover,
            ),
            title: Text(
              'Hello',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: CircleAvatar(
            backgroundColor: Colors.orange,
            radius: 30,
          ),
        ),
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              childCount: 50,
              (context, index) => Container(
                alignment: Alignment.center,
                color: Colors.amber[100 * (index % 9)],
                child: Text(
                  "item_$index",
                ),
              ),
            ),
            itemExtent: 100),
        SliverPersistentHeader(
          pinned: true,
          floating: true,
          delegate: CustomDelegate(),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: 50,
            (context, index) => Container(
              alignment: Alignment.center,
              color: Colors.blue[100 * (index % 9)],
              child: Text(
                "item_$index",
              ),
            ),
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            mainAxisSpacing: Sizes.size20,
            crossAxisSpacing: Sizes.size20,
            childAspectRatio: 1,
          ),
        )
      ],
    );
  }
}

class CustomDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.red,
      child: FractionallySizedBox(
        heightFactor: 1,
        child: Text('Title...'),
      ),
    );
  }

  @override
  double get maxExtent => 150;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
