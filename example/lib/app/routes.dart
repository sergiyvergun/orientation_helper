import 'package:example/pages/error_page.dart';
import 'package:orientation_helper/orientation_helper.dart';

import '../pages/details_page.dart';
import '../pages/home_page.dart';

class AppRoutes {
  static var home = RouteDetails(name: '/', page: HomePage());
  static var details = RouteDetails(
      name: '/details',
      page: DetailsPage(),
      orientation: ScreenOrientation.rotating);

  static var error = RouteDetails(
    name: '/error',
    page: ErrorPage(),
  );

  static List<RouteDetails> get routes => [
        home,
        details,
        error,
      ];
}
