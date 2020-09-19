import 'package:flutter/material.dart';
import 'package:instagram_clon_2/constants/screen_size.dart';
import 'package:instagram_clon_2/widget/profile_body.dart';

enum Selected { open, close }

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Selected selected = Selected.close;

  double a = 0;

  double b = size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Stack(children: [
          AnimatedContainer(
              duration: Duration(milliseconds: 500),
              transform: Matrix4.translationValues(b, 0, 0),
              child: Container(
                color: Colors.black,
              )),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            transform: Matrix4.translationValues(a, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_appBar(), ProfileBody()],
            ),
          ),
        ]),
      ),
    );
  }

  Row _appBar() {
    return Row(
      children: [
        SizedBox(
          width: 44,
        ),
        Expanded(
            child: Text(
          '떡갈나무',
          textAlign: TextAlign.center,
        )),
        IconButton(
          onPressed: () {
            setState(() {
              if (selected == Selected.close) {
                selected = Selected.open;
                b = size.width - size.width * 3 / 4;
                a = -size.width * 3 / 4;
              } else {
                selected = Selected.close;
                b = size.width;
                a = 0;
              }
            });
          },
          icon: Icon(Icons.menu),
        )
      ],
    );
  }
}
