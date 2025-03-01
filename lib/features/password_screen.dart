import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_code_challenge01/constants/gaps.dart';
import 'package:tiktok_code_challenge01/constants/sizes.dart';
import 'package:tiktok_code_challenge01/features/birthday_screen.dart';
import 'package:tiktok_code_challenge01/features/experience_screen.dart';
import 'package:tiktok_code_challenge01/widgets/full_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = '';
  bool _obsecureText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  //next 페이지 이동
  void _onNextTab() {
    if (_password != null) return;

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ExperienceScreen()),
    );
  }

  //validate : password
  bool _isPasswordValid() {
    //8글자 이상인가?
    return _password.isNotEmpty && _password.length > 8;
    //r"^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@$!%*#?&\^])[A-Za-z0-9@$!%*#?&\^]{9,}$");
  }

  //outSide를 클릭하면 onFocus
  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  //obscureText
  void _toggleObscureText() {
    if (_obsecureText == true) {
      _obsecureText = false;
    } else {
      _obsecureText = true;
    }
    setState(() {});
  }

  //삭제
  void _onClearTap() {
    _passwordController.clear();
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BirthdayScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Icon(
          FontAwesomeIcons.twitter,
          color: Colors.lightBlue,
          size: 30.0,
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _onScaffoldTap,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.size36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v40,
                    Text(
                      "Create your account",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Gaps.v16,
                    //password
                    TextField(
                      controller: _passwordController,
                      autocorrect: false,
                      decoration: InputDecoration(
                        suffix: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: _onClearTap,
                              child: FaIcon(FontAwesomeIcons.solidCircleCheck,
                                  color: Colors.green.shade400,
                                  size: Sizes.size20),
                            ),
                            Gaps.h5,
                            GestureDetector(
                              onTap: _toggleObscureText,
                              child: FaIcon(
                                  _obsecureText
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash,
                                  color: Colors.grey.shade400,
                                  size: Sizes.size20),
                            ),
                          ],
                        ),
                        hintText: "password",
                        errorText: "Invalidate password",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                      ),
                      cursorColor: Theme.of(context).primaryColor,
                    ),
                    Gaps.v10,
                    Text(
                      "Your password must have ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.circleCheck,
                            size: Sizes.size16,
                            color: _isPasswordValid()
                                ? Colors.green
                                : Colors.grey),
                        Gaps.h5,
                        Text("8 to 20 characters"),
                      ],
                    ),
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.circleCheck,
                            size: Sizes.size16,
                            color: _isPasswordValid()
                                ? Colors.green
                                : Colors.grey),
                        Gaps.h5,
                        Text("8 to 20 characters"),
                      ],
                    ),
                    Gaps.v28,
                    FullButton(
                      text: "Next",
                      textColor: Colors.white,
                      backgroundColor: _isPasswordValid()
                          ? Colors.grey.shade300
                          : Colors.greenAccent,
                      borderColor: _isPasswordValid()
                          ? Colors.grey.shade300
                          : Colors.greenAccent,
                      isEnabled: _isPasswordValid(),
                      onTap: _isPasswordValid()
                          ? () {
                              _onNextTab();
                            }
                          : null, // 비활성화 상태에서는 동작하지 않음
                    ),
                    // FractionallySizedBox(
                    //   widthFactor: 1,
                    //   child : AnimatedContainer(
                    //     duration: Duration(milliseconds :2),
                    //     padding: const EdgeInsets.symmetric(vertical:Sizes.size16),
                    //     decoration: BoxDecoration(
                    //       color: _userName.isEmpty ? Colors.grey.shade300 : Colors.greenAccent,
                    //       borderRadius: BorderRadius.circular(Sizes.size16),
                    //     ),
                    //     child: AnimatedDefaultTextStyle(
                    //       duration: Duration(milliseconds: 2),
                    //       style: TextStyle(
                    //         color: _userName.isEmpty ? Colors.grey.shade400 :  Colors.white,
                    //         fontWeight: FontWeight.w600,
                    //       ),
                    //       child: Text(
                    //         "Next",
                    //         textAlign: TextAlign.center,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
