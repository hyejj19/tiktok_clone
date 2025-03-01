import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_code_challenge01/features/discover/discover_screen.dart';
import 'package:tiktok_code_challenge01/features/inbox/inbox_screen.dart';
import 'package:tiktok_code_challenge01/features/users/user_profile_screen.dart';
import 'package:tiktok_code_challenge01/widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 3;

  final screens = [
    Center(
      child: Text('home'),
    ),
    Center(
      child: Text('search'),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: Scaffold(
              body: Center(child: Text('home screen')),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: Scaffold(
              body: DiscoverScreen(),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: Scaffold(
              body: Scaffold(
                body: InboxScreen(),
              ),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: Scaffold(
              body: UserProfileScreen(),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _selectedIndex == 0 ? Colors.black : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              text: "Home",
              isSelected: _selectedIndex == 0,
              icon: FontAwesomeIcons.house,
              onTap: () => _onTap(0),
              iconColor: _selectedIndex == 0 ? Colors.white : Colors.black,
            ),
            NavTab(
              text: "Discover",
              isSelected: _selectedIndex == 1,
              icon: FontAwesomeIcons.magnifyingGlass,
              onTap: () => _onTap(1),
              iconColor: _selectedIndex == 0 ? Colors.white : Colors.black,
            ),
            NavTab(
              text: "Inbox",
              isSelected: _selectedIndex == 2,
              icon: FontAwesomeIcons.message,
              onTap: () => _onTap(2),
              iconColor: _selectedIndex == 0 ? Colors.white : Colors.black,
            ),
            NavTab(
              text: "Profile",
              isSelected: _selectedIndex == 3,
              icon: FontAwesomeIcons.user,
              onTap: () => _onTap(3),
              iconColor: _selectedIndex == 0 ? Colors.white : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
