import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_code_challenge01/constants/gaps.dart';
import 'package:tiktok_code_challenge01/features/account_screen.dart';
import 'package:tiktok_code_challenge01/features/login_form_screen.dart';
import 'package:tiktok_code_challenge01/widgets/full_button.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  //accountTap : 계정 생성하기
  void _onAccountTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AccountScreen()));
  }

  //login_form_screen 이동
  void _Login(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginFormScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Icon(
          FontAwesomeIcons.twitter,
          color: Colors.lightBlue,
          size: 30.0,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gaps.v96,
                Text(
                  "See What's happening",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
                Gaps.v3,
                Text(
                  "in the world right now.",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
                Gaps.v96,
                Padding(
                  padding: EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Column(
                    children: [
                      FullButton(
                          text: 'Continue with Google',
                          textColor: Colors.black,
                          icon: FontAwesomeIcons.google,
                          borderColor: Colors.grey,
                          backgroundColor: Colors.white,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("다음 이 시간에 ~ google login~"),
                              ),
                            );
                          }),
                      Gaps.v16,
                      FullButton(
                          text: 'Continue with Apple',
                          textColor: Colors.black,
                          icon: FontAwesomeIcons.apple,
                          borderColor: Colors.grey,
                          backgroundColor: Colors.white,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("다음 이 시간에 ~ apple login~"),
                              ),
                            );
                          }),
                      Gaps.v32,
                      FullButton(
                        text: 'Create account',
                        textColor: Colors.white,
                        borderColor: Colors.grey,
                        backgroundColor: Colors.black,
                        onTap: () => _onAccountTap(context),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text("By signing up, you agree to our"),
                            ),
                            GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("다음 이 시간에~ Terms"),
                                  ),
                                );
                              },
                              child: Text(
                                "Terms",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("다음 이 시간에~ Pricavy Policy"),
                                    ),
                                  );
                                },
                                child: Text("Privacy Policy",
                                    style: TextStyle(color: Colors.blue))),
                            Text(", and "),
                            GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("다음 이 시간에~ Cookie Use"),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Cookie Use.",
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 45),
                        child: Row(
                          children: [
                            Text(
                              "Have an account already?",
                            ),
                            Gaps.h10,
                            GestureDetector(
                              onTap: () => _Login(context),
                              child: Text(
                                "Log in",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
