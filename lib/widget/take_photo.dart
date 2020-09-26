import 'package:flutter/material.dart';
import 'package:instagram_clon_2/constants/screen_size.dart';

class TakePhoto extends StatelessWidget {
  const TakePhoto({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double x = 20.0;
    return Column(
      children: [
        Container(
          width: size.width,
          height: size.width,
          color: Colors.green,
        ),
        Expanded(
            child: OutlineButton(
          onPressed: () {},
          shape: CircleBorder(),
          borderSide: BorderSide(width: 20, color: Colors.black12),
        ))
      ],
    );
  }
}
