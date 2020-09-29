import 'package:camera/camera.dart';

import 'package:flutter/material.dart';

class CameraState extends ChangeNotifier {
  CameraController _controller;
  CameraDescription _cameraDescription;
  bool _readyTakePhoto = false;

  void getReadyToTakePhoto() async {
    List<CameraDescription> cameras = await availableCameras();
    if (cameras != null && cameras.isNotEmpty) {
      setCameraDescription(cameras[0]);
    }

    bool init = false;
    while (!init) {
      init = await initialize();
    }
    _readyTakePhoto = true;
    notifyListeners();
  }

  void setCameraDescription(CameraDescription cameraDescription) {
    _cameraDescription = cameraDescription;
    _controller = CameraController(_cameraDescription, ResolutionPreset.medium);
  }

  Future<bool> initialize() async {
    try {
      _controller.initialize();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  CameraController get controller => _controller;
  CameraDescription get cameraDescription => _cameraDescription;
  bool get isReadyToTakePhoto => _readyTakePhoto;
}
