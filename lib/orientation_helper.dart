library orientation_helper;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orientation_helper/utils/navigator_utils.dart';
import 'package:orientation_helper/utils/orientation_utils.dart';

import 'models/route_details.dart';

class OrientationHelper {
  final List<RouteDetails> routes;
  NavigatorObserverWithOrientation navigatorObserver;

  OrientationHelper({@required this.routes});

  NavigatorUtils _navigatorUtils;
  OrientationUtils _orientationUtils;

  main() {
    _navigatorUtils = NavigatorUtils(routes: routes);
    _orientationUtils = OrientationUtils();

    navigatorObserver = _navigatorUtils.observer;
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return _navigatorUtils.onGenerateRoute(settings);
  }
}
