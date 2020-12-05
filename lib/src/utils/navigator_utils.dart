import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orientation_helper/src/models/route_details.dart';
import 'package:orientation_helper/src/models/screen_orientation.dart';
import 'orientation_utils.dart';

class NavigatorUtils {
  final List<RouteDetails> routes;
  final OrientationUtils orientationUtils;

  NavigatorUtils({
    @required this.routes,
    @required this.orientationUtils,
  });

  NavigatorObserverWithOrientation get observer =>
      NavigatorObserverWithOrientation(
          onNeedChangeRouteOrientation: (Route<dynamic> route) {
        orientationUtils.changeRouteOrientation(route);
      });

  /// get routeDetails and set orientation setting to the route
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    var routeDetails = routes
        .firstWhere((RouteDetails details) => details.name == settings.name);

    return MaterialPageRoute(
        builder: (context) => routeDetails.page,
        settings: rotationSettings(settings, routeDetails.orientation));
  }
}

/// handle orientation
class NavigatorObserverWithOrientation extends NavigatorObserver {
  final Function(Route route) onNeedChangeRouteOrientation;

  NavigatorObserverWithOrientation(
      {@required this.onNeedChangeRouteOrientation});

  /// set orientation on didPop
  @override
  void didPop(Route route, Route previousRoute) {
    onNeedChangeRouteOrientation(previousRoute);
  }

  /// set orientation on didPush
  @override
  void didPush(Route route, Route previousRoute) {
    onNeedChangeRouteOrientation(route);
  }
}

RouteSettings rotationSettings(
    RouteSettings settings, ScreenOrientation rotation) {
  return RouteSettings(name: settings.name, arguments: rotation);
}
