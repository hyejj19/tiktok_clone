import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  final bool disabled;
  final Function onTapFunction;

  const FormButton({
    super.key,
    required this.disabled,
    required this.onTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapFunction(),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: AnimatedContainer(
          duration: Duration(
            milliseconds: 200,
          ),
          padding: EdgeInsets.symmetric(vertical: Sizes.size16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Sizes.size5,
            ),
            color: disabled
                ? Colors.grey.shade400
                : Theme.of(context).primaryColor,
          ),
          child: AnimatedDefaultTextStyle(
            duration: Duration(
              milliseconds: 200,
            ),
            style: TextStyle(
              color: disabled ? Colors.grey.shade800 : Colors.white,
              fontWeight: FontWeight.w600,
            ),
            child: Text(
              'Next',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
