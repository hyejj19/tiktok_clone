import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_code_challenge01/constants/gaps.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.text,
    required this.isSelected,
    required this.icon,
    required this.onTap,
    required this.iconColor,
  });

  final String text;
  final bool isSelected;
  final IconData icon;
  final Function onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: AnimatedOpacity(
          opacity: isSelected ? 1 : 0.6,
          duration: Duration(milliseconds: 300),
          child: Column(
            children: [
              FaIcon(
                icon,
                color: iconColor,
              ),
              Gaps.v10,
              Text(
                text,
                style: TextStyle(
                  color: iconColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
