import 'package:flutter/services.dart';
import 'package:orientation_helper/src/models/screen_orientation.dart';

class OrientationUtils {
  /// set preferred orientations

  void setOrientation(ScreenOrientation orientation) {
    List<DeviceOrientation> orientations;
    switch (orientation) {
      case ScreenOrientation.portraitOnly:
        orientations = [
          DeviceOrientation.portraitUp,
        ];
        break;
      case ScreenOrientation.landscapeOnly:
        orientations = [
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ];
        break;
      case ScreenOrientation.rotating:
        orientations = [
          DeviceOrientation.portraitUp,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ];
        break;
    }
    SystemChrome.setPreferredOrientations(orientations);
  }
}
