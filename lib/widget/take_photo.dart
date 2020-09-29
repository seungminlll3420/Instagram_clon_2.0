import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clon_2/constants/screen_size.dart';
import 'package:instagram_clon_2/model/camera_state.dart';
import 'package:instagram_clon_2/widget/my_progress_indicator.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({
    Key key,
  }) : super(key: key);

  @override
  _TakePhotoState createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  Widget _progress = MyProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return Consumer<CameraState>(
      builder: (context, CameraState cameraState, child) {
        return Column(
          children: <Widget>[
            Container(
              width: size.width,
              height: size.width,
              color: Colors.green,
              child: (cameraState.isReadyToTakePhoto)
                  ? _getPreview(cameraState)
                  : _progress,
            ),
            Expanded(
                child: OutlineButton(
              onPressed: () {
                _attemptTakePhoto(cameraState);
              },
              shape: CircleBorder(),
              borderSide: BorderSide(width: 10, color: Colors.black12),
            ))
          ],
        );
      },
    );
  }

  void _attemptTakePhoto(CameraState cameraState) async {
    final String timeInMulli = DateTime.now().millisecondsSinceEpoch.toString();

    try {
      final path =
          join((await getTemporaryDirectory()).path, '$timeInMulli.png');
      await cameraState.controller.takePicture(path);
    } catch (e) {}
  }

  Widget _getPreview(CameraState cameraState) {
    return ClipRect(
      child: OverflowBox(
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Container(
              width: size.width,
              height: size.width / cameraState.controller.value.aspectRatio,
              child: CameraPreview(cameraState.controller)),
        ),
      ),
    );
  }
}
