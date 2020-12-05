import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orientation_helper/src/models/route_details.dart';
import 'package:orientation_helper/src/models/screen_orientation.dart';
import 'orientation_utils.dart';

class NavigatorUtils {
  final List<RouteDetails> routes;

  NavigatorUtils({@required this.routes});

  final observer = NavigatorObserverWithOrientation();

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
  /// set orientation on didPop
  @override
  void didPop(Route route, Route previousRoute) {
    changeRouteOrientation(previousRoute);
  }

  /// set orientation on didPush
  @override
  void didPush(Route route, Route previousRoute) {
    changeRouteOrientation(route);
  }

  void changeRouteOrientation(Route route) {
    /// Change orientation only if it's a PageRoute don't change for ModalBottomSheetRoute etc
    if (route is PageRoute) {
      // route has orientation setting
      if (route.settings.arguments is ScreenOrientation) {
        OrientationUtils().setOrientation(route.settings.arguments);
      } else {
        OrientationUtils().setOrientation(ScreenOrientation.portraitOnly);
      }
    }
  }
}

RouteSettings rotationSettings(
    RouteSettings settings, ScreenOrientation rotation) {
  return RouteSettings(name: settings.name, arguments: rotation);
}
