import 'package:orientation_helper/orientation_helper.dart';

import '../pages/details_page.dart';
import '../pages/home_page.dart';

class AppRoutes {
  static var home = RouteDetails(
    name: 'home',
    page: HomePage(),
    orientation: ScreenOrientation.portraitOnly,
  );
  static var details = RouteDetails(
    name: '/details',
    page: DetailsPage(),
    orientation: ScreenOrientation.rotating,
  );

  static List<RouteDetails> get routes => [
        home,
        details,
      ];
}
