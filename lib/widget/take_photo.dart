import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clon_2/constants/screen_size.dart';
import 'package:instagram_clon_2/widget/my_progress_indicator.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({
    Key key,
  }) : super(key: key);

  @override
  _TakePhotoState createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  Widget _progress = MyProgressIndicator();
  CameraController _controller;
  int cameraindex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CameraDescription>>(
      future: availableCameras(),
      builder: (context, snapshot) {
        print(snapshot.data.toString());
        return Column(
          children: <Widget>[
            Container(
              width: size.width,
              height: size.width,
              color: Colors.green,
              child:
                  (snapshot.hasData) ? _getPreview(snapshot.data) : _progress,
            ),
            Expanded(
                child: OutlineButton(
              onPressed: () {
                setState(() {
                  if (cameraindex == 0) {
                    cameraindex = 1;
                  } else {
                    cameraindex = 0;
                  }
                });
              },
              shape: CircleBorder(),
              borderSide: BorderSide(width: 10, color: Colors.black12),
            ))
          ],
        );
      },
    );
  }

  Widget _getPreview(List<CameraDescription> camera) {
    print(camera.toString());
    _controller = CameraController(camera[0], ResolutionPreset.medium);
    return FutureBuilder(
      future: _controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return CameraPreview(_controller);
        } else {
          return _progress;
        }
      },
    );
  }
}
