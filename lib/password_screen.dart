import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/auth/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({
    super.key,
  });

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = '';
  bool _isObsecureText = true;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(
      () {
        setState(() {
          _password = _passwordController.text;
        });
      },
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length >= 8;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_password.isEmpty || !_isPasswordValid()) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PasswordScreen(),
      ),
    );
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _onObsecureTap() {
    setState(() {
      _isObsecureText = !_isObsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Sign up',
            style: TextStyle(
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              Text(
                'Password?',
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v8,
              Gaps.v32,
              TextField(
                controller: _passwordController,
                autocorrect: false,
                onEditingComplete: _onSubmit,
                obscureText: _isObsecureText,
                decoration: InputDecoration(
                  hintText: 'Make it strong!',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h14,
                      GestureDetector(
                        onTap: _onObsecureTap,
                        child: _isObsecureText
                            ? FaIcon(
                                FontAwesomeIcons.eyeSlash,
                                color: Colors.grey.shade400,
                                size: Sizes.size20,
                              )
                            : FaIcon(
                                FontAwesomeIcons.eye,
                                color: Colors.grey.shade400,
                                size: Sizes.size20,
                              ),
                      )
                    ],
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v10,
              Text(
                'Your password must have:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size16 + Sizes.size2,
                    color: _isPasswordValid()
                        ? Colors.green
                        : Colors.grey.shade400,
                  ),
                  Gaps.h10,
                  Text(
                    '8 to 20 characters',
                  ),
                ],
              ),
              Gaps.v4,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size16 + Sizes.size2,
                    color: _isPasswordValid()
                        ? Colors.green
                        : Colors.grey.shade400,
                  ),
                  Gaps.h10,
                  Text(
                    'Letters, numbers, and special characters',
                  ),
                ],
              ),
              Gaps.v28,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  disabled: !_isPasswordValid(),
                  onTapFunction: () => {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
