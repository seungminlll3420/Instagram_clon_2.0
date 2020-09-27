import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {
  final double containerSize;
  final double progressSize;

  MyProgressIndicator({this.containerSize, Key key, this.progressSize = 60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: containerSize,
        height: containerSize,
        color: Colors.amberAccent[100],
        child: Center(
          child: SizedBox(
              height: progressSize,
              width: progressSize,
              child: Image.asset(
                'assets/images/byNH_loding.gif',
              )),
        ));
  }
}
