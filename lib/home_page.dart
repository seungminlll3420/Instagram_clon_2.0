import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clon_2/constants/screen_size.dart';
import 'package:instagram_clon_2/screen/camera_screen.dart';
import 'package:instagram_clon_2/screen/feed_screen.dart';
import 'package:instagram_clon_2/screen/profile_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> btmNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('')),
    BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('')),
    BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('')),
    BottomNavigationBarItem(icon: Icon(Icons.healing), title: Text('')),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('')),
  ];
  int _selctedIndex = 0;
  static List<Widget> _screens = <Widget>[
    FeedScreen(),
    Container(
      color: Colors.blueAccent,
    ),
    Container(
      color: Colors.greenAccent,
    ),
    Container(
      color: Colors.deepPurpleAccent,
    ),
    ProfileScreen()
  ];
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    if (size == null) {
      size = MediaQuery.of(context).size;
    }
    return Scaffold(
      key: _key,
      body: IndexedStack(
        index: _selctedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: btmNavItems,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black87,
        currentIndex: _selctedIndex,
        onTap: _onBtmItemClick,
      ),
    );
  }

  void _onBtmItemClick(int index) {
    switch (index) {
      case 2:
        _openCamera();
        break;
      default:
        {
          setState(() {
            _selctedIndex = index;
          });
        }
    }
  }

  void _openCamera() async {
    if (await chackIfpermissionGranted(context)) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CameraScrren(),
      ));
    } else {
      SnackBar snackBar = SnackBar(
        content: Text('카메라와 갤러리, 마이크의 접근 승인을 하지 않으셨습니다.'),
        action: SnackBarAction(
            label: 'OK',
            onPressed: () {
              _key.currentState.hideCurrentSnackBar();
              AppSettings.openAppSettings();
            }),
      );
      _key.currentState.showSnackBar(snackBar);
    }
  }

  Future<bool> chackIfpermissionGranted(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
      Platform.isIOS ? Permission.photos : Permission.storage,
    ].request();
    bool permitted = true;
    statuses.forEach((permission, permissionStatus) {
      if (!permissionStatus.isGranted) {
        permitted = false;
      }
    });
    return permitted;
  }
}
