import 'package:flutter/material.dart';
import 'package:instagram_clon_2/widget/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_appBar(), ProfileBody()],
        ),
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
          onPressed: () {},
          icon: Icon(Icons.menu),
        )
      ],
    );
  }
}
