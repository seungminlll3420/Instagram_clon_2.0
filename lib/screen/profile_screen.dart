import 'package:flutter/material.dart';
import 'package:instagram_clon_2/constants/screen_size.dart';

import 'package:instagram_clon_2/widget/profile_body.dart';

enum Menustatus { opened, closed }

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final duration = Duration(milliseconds: 500);
  final double menuwidth = size.width / 2;
  Menustatus _menustatus = Menustatus.closed;
  double bodyxpos = 0;
  double menuxpos = size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Stack(children: [
          AnimatedContainer(
              duration: duration,
              curve: Curves.fastOutSlowIn,
              transform: Matrix4.translationValues(bodyxpos, 0, 0),
              child: ProfileBody(onMenuChanged: () {
                setState(() {
                  _menustatus = (_menustatus == Menustatus.closed)
                      ? Menustatus.opened
                      : Menustatus.closed;
                  switch (_menustatus) {
                    case Menustatus.opened:
                      bodyxpos = -menuwidth;
                      menuxpos = size.width - menuwidth;
                      break;
                    case Menustatus.closed:
                      bodyxpos = 0;
                      menuxpos = size.width;
                      break;
                  }
                });
              })),
          AnimatedContainer(
            duration: duration,
            curve: Curves.fastOutSlowIn,
            transform: Matrix4.translationValues(menuxpos, 0, 0),
            child: Positioned(
              top: 0,
              bottom: 0,
              width: size.width / 2,
              child: Container(
                color: Colors.purple,
              ),
            ),
          )
        ]));
  }
}
