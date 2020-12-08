import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orientation_helper/src/models/route_arguments.dart';
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

    /// Go to error route if there is no needed one
    if (routeDetails == null) {
      var errorPage = routes
          .firstWhere((RouteDetails details) => details.name == '/error')
          .page;

      /// There is no possibility to show error page
      if (errorPage != null) {
        return MaterialPageRoute(
          builder: (context) => errorPage,
          settings: RouteSettings(
            name: '/error',
          ),
        );
      }
    }

    return MaterialPageRoute(
        builder: (context) => routeDetails.page,
        settings: RouteSettings(
          name: settings.name,
          arguments: RouteArguments(settings.arguments,
              orientation: routeDetails.orientation),
        ));
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
