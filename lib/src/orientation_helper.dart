import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orientation_helper/src/utils/navigator_utils.dart';
import 'package:orientation_helper/src/utils/orientation_utils.dart';

import 'models/route_details.dart';

class OrientationHelper {
  final List<RouteDetails> routes;

  NavigatorObserverWithOrientation get navigatorObserver =>
      _navigatorUtils.observer;

  final NavigatorUtils _navigatorUtils;
  final OrientationUtils _orientationUtils;

  OrientationHelper({@required this.routes})
      : _navigatorUtils = NavigatorUtils(routes: routes),
        _orientationUtils = OrientationUtils();

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return _navigatorUtils.onGenerateRoute(settings);
  }
}
