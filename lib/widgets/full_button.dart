
import 'package:flutter/material.dart';
import 'package:tiktok_code_challenge01/constants/gaps.dart';
import 'package:tiktok_code_challenge01/constants/sizes.dart';

class FullButton extends StatelessWidget {
  final String text; //버튼 텍스트
  final Color textColor; //버튼 색상
  final IconData? icon; //아이콘 사용할 것인지 ?
  final Color? borderColor; //버튼 보더 색상을 줄것인지
  final Color? backgroundColor; // 버튼 백그라운드 색상
  final VoidCallback? onTap; //버튼 탭시 동작
  final bool isEnabled; //버튼의 비활성화 상태

  const FullButton({super.key, required this.text, required this.textColor, this.icon, this.borderColor, this.backgroundColor, this.onTap, this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled! ? onTap : null,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: Sizes.size16),
          decoration: BoxDecoration(
              color: isEnabled ? (backgroundColor ?? Colors.white) : Colors.grey.shade200,
              border: Border.all(
                color: isEnabled ? (borderColor ?? Colors.grey.shade300) : Colors.grey.shade400,
                width: Sizes.size1,
              ),
            borderRadius: BorderRadius.circular(Sizes.size32),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(icon != null)...[
                  Icon(
                    icon,
                    color: isEnabled ? textColor : Colors.grey,
                    size: Sizes.size20,
                  ),
                  Gaps.h10,
                ],
                Text(
                  text,
                  style: TextStyle(
                    color: isEnabled ? textColor : Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
