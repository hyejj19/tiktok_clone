import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/auth/widgets/form_button.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({
    super.key,
  });

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();

  String _username = '';

  @override
  void initState() {
    super.initState();

    _usernameController.addListener(
      () {
        setState(() {
          _username = _usernameController.text;
        });
      },
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void onTapNextButton() {
    if (_username.isEmpty) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UsernameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Create username',
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.v8,
            Text(
              'You can always change this later.',
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.grey.shade600,
              ),
            ),
            Gaps.v32,
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Username',
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
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v28,
            FormButton(
              disabled: _username.isEmpty,
              onTapFunction: onTapNextButton,
            )
          ],
        ),
      ),
    );
  }
}
