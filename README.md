# orientation_helper

A Flutter plugin for handling screen orientation for every route in your app.




## Getting Started


Create routes and set their orientation

``` dart
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
```
ScreenOrientantion.portraitOnly set as default



Setup OrientationHelper

   ``` dart

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  OrientationHelper orientationHelper;

  @override
  void initState() {
    orientationHelper = OrientationHelper(routes: AppRoutes.routes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// Setup OrientationHelper
      initialRoute: AppRoutes.home.name,
      navigatorObservers: [
        orientationHelper.navigatorObserver,
      ],
      onGenerateRoute: orientationHelper.onGenerateRoute,
    );
  }
}

   ```

Navigate with pushNamed
``` dart
Navigator.of(context).pushNamed(AppRoutes.details.name);
```
