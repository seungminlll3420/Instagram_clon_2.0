import 'package:flutter/material.dart';
import 'package:instagram_clon_2/screen/profile_screen.dart';
import 'package:instagram_clon_2/widget/sign_in_form.dart';
import 'package:instagram_clon_2/widget/sign_up_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Widget _signInForm = SignInForm();
  Widget _signUpForm = SignUpForm();
  Widget currentWidget;
  @override
  void initState() {
    if (currentWidget == null) currentWidget = _signInForm;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedSwitcher(
              child: currentWidget,
              duration: duration,
            ),
            Container(
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    if (currentWidget == _signInForm) {
                      currentWidget = _signUpForm;
                    } else {
                      currentWidget = _signInForm;
                    }
                  });
                },
                child: Text('goto SignIn'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
