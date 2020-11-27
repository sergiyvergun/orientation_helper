import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orientation_helper/src/models/route_details.dart';
import 'package:orientation_helper/src/models/screen_orientation.dart';
import 'orientation_utils.dart';

class NavigatorUtils {
  final List<RouteDetails> routes;

  NavigatorUtils({@required this.routes});

  final observer = NavigatorObserverWithOrientation();

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    var routeDetails = routes
        .firstWhere((RouteDetails details) => details.name == settings.name);

    return MaterialPageRoute(
        builder: (context) => routeDetails.page,
        settings: rotationSettings(settings, routeDetails.orientation));
  }
}

class NavigatorObserverWithOrientation extends NavigatorObserver {
  @override
  void didPop(Route route, Route previousRoute) {
    if (previousRoute.settings.arguments is ScreenOrientation) {
      OrientationUtils().setOrientation(previousRoute.settings.arguments);
    } else {
      // Portrait-only is the default option
      OrientationUtils().setOrientation(ScreenOrientation.portraitOnly);
    }
  }

  @override
  void didPush(Route route, Route previousRoute) {
    if (route.settings.arguments is ScreenOrientation) {
      OrientationUtils().setOrientation(route.settings.arguments);
    } else {
      OrientationUtils().setOrientation(ScreenOrientation.portraitOnly);
    }
  }
}

RouteSettings rotationSettings(
    RouteSettings settings, ScreenOrientation rotation) {
  return RouteSettings(name: settings.name, arguments: rotation);
}
