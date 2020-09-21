import 'package:flutter/material.dart';
import 'package:instagram_clon_2/constants/common_size.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              decoration: _textInputDecor('email'),
              validator: (text) {
                if (text.isNotEmpty && text.contains('@')) {
                  return null;
                } else {
                  return "이메일을 확인해주세요.";
                }
              },
            ),
            SizedBox(
              height: common_xs_gap,
            ),
            TextFormField(
              controller: _pwController,
              decoration: _textInputDecor('Password'),
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
          ],
        ),
      ),
    );
  }

  InputDecoration _textInputDecor(String text) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey[100],
      hintText: text,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(common_s_gap),
          borderSide: BorderSide(color: Colors.grey[300])),
    );
  }
}
