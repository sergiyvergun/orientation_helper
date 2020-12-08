import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:orientation_helper/orientation_helper.dart';
import 'package:orientation_helper/src/models/screen_orientation.dart';

class OrientationUtils {
  final ScreenOrientation defaultOrientation;

  OrientationUtils({@required this.defaultOrientation});

  void changeRouteOrientation(Route route) {
    /// Change orientation only if it's a PageRoute don't change for ModalBottomSheetRoute etc
    if (route is PageRoute) {
      //Check route has orientation setting
      if (route.settings.arguments is RouteArguments &&
          (route.settings.arguments as RouteArguments).orientation != null) {
        setOrientation(
            (route.settings.arguments as RouteArguments).orientation);
      } else {
        setOrientation(defaultOrientation);
      }
    }
  }

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
