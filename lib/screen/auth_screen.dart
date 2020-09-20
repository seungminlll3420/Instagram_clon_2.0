import 'package:flutter/material.dart';
import 'package:instagram_clon_2/screen/profile_screen.dart';
import 'package:instagram_clon_2/widget/fade_stack.dart';
import 'package:instagram_clon_2/widget/sign_in_form.dart';
import 'package:instagram_clon_2/widget/sign_up_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int selectedForm = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FadeStack(
              selectedForm: selectedForm,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 50,
              child: Container(
                color: Colors.white,
                child: FlatButton(
                    shape: Border(
                        top: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    )),
                    onPressed: () {
                      setState(() {
                        if (selectedForm == 0) {
                          selectedForm = 1;
                        } else {
                          selectedForm = 0;
                        }
                      });
                    },
                    child: RichText(
                      text: TextSpan(
                          text: selectedForm == 0
                              ? "Don't have an account? "
                              : "Already have an account? ",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                          children: [
                            TextSpan(
                                text: selectedForm == 0 ? "SignUp" : "SignIn",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold)),
                          ]),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
