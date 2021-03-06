import 'package:flutter/material.dart';
import 'package:instagram_clon_2/constants/common_size.dart';
import 'package:instagram_clon_2/home_page.dart';
import 'package:instagram_clon_2/model/firebase_auth_state.dart';

import 'package:instagram_clon_2/widget/or_divider.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _cpwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    _cpwController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: common_l_gap,
              ),
              Image.asset('assets/images/insta_text_logo.png'),
              TextFormField(
                controller: _emailController,
                cursorColor: Colors.black45,
                decoration: textInputDecor('email'),
                validator: (text) {
                  if (text.isNotEmpty && text.contains('@')) {
                    return null;
                  } else {
                    return "이메일을 다시 확인해주세요.";
                  }
                },
              ),
              SizedBox(
                height: common_xs_gap,
              ),
              TextFormField(
                controller: _pwController,
                cursorColor: Colors.black45,
                obscureText: true,
                decoration: textInputDecor('Password'),
                validator: (text) {
                  if (text.isNotEmpty && text.length > 6) {
                    return null;
                  } else {
                    return "비밀번호를 확인해주세요";
                  }
                },
              ),
              SizedBox(
                height: common_xs_gap,
              ),
              TextFormField(
                controller: _cpwController,
                cursorColor: Colors.black45,
                obscureText: true,
                decoration: textInputDecor('Confirm password'),
                validator: (text) {
                  if (text.isNotEmpty && (text == _pwController.text)) {
                    return null;
                  } else {
                    return "비밀번호가 같지 않습니다. 확인해주세요";
                  }
                },
              ),
              SizedBox(
                height: common_s_gap,
              ),
              _submitButton(context),
              SizedBox(
                height: common_s_gap,
              ),
              OrDivider(),
              FlatButton.icon(
                  textColor: Colors.blueAccent,
                  onPressed: () {
                    Provider.of<FirebaseAuthState>(context, listen: false)
                        .loginWithFacebook(context);
                  },
                  icon: ImageIcon(AssetImage('assets/images/facebook.png')),
                  label: Text('Login with Facebook')),
            ],
          ),
        ),
      ),
    );
  }

  Stack _orDivider() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          left: 0,
          right: 0,
          height: 1,
          child: Container(
            height: 1,
            color: Colors.grey[300],
          ),
        ),
        Container(
          height: 3,
          width: 60,
          color: Colors.grey[50],
        ),
        Text(
          'OR',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[500]),
        )
      ],
    );
  }

  FlatButton _submitButton(BuildContext context) {
    return FlatButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          Provider.of<FirebaseAuthState>(context, listen: false).registerUser(
              context,
              email: _emailController.text,
              password: _pwController.text);
        }
      },
      child: Text(
        'Join',
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    );
  }

  InputDecoration textInputDecor(String text) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey[100],
      hintText: text,
      focusedBorder: activeInputBorder(),
      focusedErrorBorder: activeInputBorder(),
      errorBorder: errorInputBorder(),
      enabledBorder: activeInputBorder(),
    );
  }

  OutlineInputBorder errorInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(common_xs_gap),
        borderSide: BorderSide(color: Colors.redAccent));
  }

  OutlineInputBorder activeInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(common_xs_gap),
        borderSide: BorderSide(color: Colors.grey[300]));
  }
}
