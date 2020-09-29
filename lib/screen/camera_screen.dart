import 'package:flutter/material.dart';
import 'package:instagram_clon_2/model/camera_state.dart';
import 'package:instagram_clon_2/screen/profile_screen.dart';
import 'package:instagram_clon_2/widget/my_gallery.dart';
import 'package:instagram_clon_2/widget/take_photo.dart';
import 'package:provider/provider.dart';

class CameraScrren extends StatefulWidget {
  CameraState _cameraState = CameraState();
  @override
  _CameraScrrenState createState() {
    _cameraState.getReadyToTakePhoto();
    return _CameraScrrenState();
  }
}

class _CameraScrrenState extends State<CameraScrren> {
  int _currentIndex = 1;
  PageController _pageController = PageController(initialPage: 1);
  String _title = 'PHOTO';
  @override
  void dispose() {
    _pageController.dispose();
    widget._cameraState.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CameraState>.value(value: widget._cameraState)
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: PageView(
          controller: _pageController,
          children: [
            MyGallery(),
            TakePhoto(),
            Container(
              color: Colors.blue,
            ),
          ],
          onPageChanged: (index) {
            setState(() {
              switch (index) {
                case 0:
                  _title = 'GALLERY';
                  break;
                case 1:
                  _title = 'PHOTO';
                  break;
                case 2:
                  _title = 'VIDEO';
                  break;
              }
              _currentIndex = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
            iconSize: 0,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            selectedItemColor: Colors.black87,
            unselectedItemColor: Colors.black54,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.ac_unit), title: Text('GALLERY')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.ac_unit), title: Text('PHOTO')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.ac_unit), title: Text('VIDEO')),
            ],
            currentIndex: _currentIndex,
            onTap: _onItemTabbed),
      ),
    );
  }

  void _onItemTabbed(index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(_currentIndex,
          duration: duration, curve: Curves.fastOutSlowIn);
    });
  }
}
