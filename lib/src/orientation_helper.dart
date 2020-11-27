import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orientation_helper/src/utils/navigator_utils.dart';
import 'package:orientation_helper/src/utils/orientation_utils.dart';

import 'models/route_details.dart';

/// To help with setting specific orientation for every page
class OrientationHelper {
  final List<RouteDetails> routes;

  NavigatorObserverWithOrientation get navigatorObserver =>
      _navigatorUtils.observer;

  final NavigatorUtils _navigatorUtils;

  OrientationHelper({@required this.routes})
      : _navigatorUtils = NavigatorUtils(routes: routes);

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return _navigatorUtils.onGenerateRoute(settings);
  }
}
