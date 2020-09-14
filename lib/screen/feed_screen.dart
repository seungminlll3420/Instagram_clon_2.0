import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clon_2/widget/post.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: peedPageAppBar(),
      body: feedPageBody(),
    );
  }

  ListView feedPageBody() {
    return ListView.builder(
      itemBuilder: feedPageBuilder,
      itemCount: 30,
    );
  }

  Widget feedPageBuilder(BuildContext context, int index) {
    return Post(index);
  }

  CupertinoNavigationBar peedPageAppBar() {
    return CupertinoNavigationBar(
      leading: IconButton(
          onPressed: null,
          icon: Icon(
            Icons.camera_alt,
            color: Colors.black87,
          )),
      middle: Text(
        'Instagram clone',
        style: TextStyle(fontFamily: 'VeganStyle', color: Colors.black),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: null,
            icon: ImageIcon(
              AssetImage('assets/images/actionbar_camera.png'),
              color: Colors.black87,
            ),
          ),
          IconButton(
            onPressed: null,
            icon: ImageIcon(
              AssetImage('assets/images/actionbar_camera.png'),
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
