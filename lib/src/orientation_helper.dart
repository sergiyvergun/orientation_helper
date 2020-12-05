import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orientation_helper/src/utils/navigator_utils.dart';

import 'package:orientation_helper/src/models/screen_orientation.dart';
import 'package:orientation_helper/src/utils/orientation_utils.dart';

import 'models/route_details.dart';

/// To help with setting specific orientation for every route
class OrientationHelper {
  final List<RouteDetails> routes;

  /// Orientation for routes that do not have orientation settings
  final ScreenOrientation defaultOrientation;

  NavigatorObserverWithOrientation get navigatorObserver =>
      _navigatorUtils.observer;

  final NavigatorUtils _navigatorUtils;

  OrientationHelper({
    @required this.routes,
    this.defaultOrientation = ScreenOrientation.landscapeOnly,
  }) : _navigatorUtils = NavigatorUtils(
          routes: routes,
          orientationUtils:
              OrientationUtils(defaultOrientation: defaultOrientation),
        );

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return _navigatorUtils.onGenerateRoute(settings);
  }
}
