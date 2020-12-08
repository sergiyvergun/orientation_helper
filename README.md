# orientation_helper

A Flutter plugin to easily handle screen orientation for every route in your app.
<p align="center">
<img src="https://user-images.githubusercontent.com/30001806/100485162-c257d400-3107-11eb-9d1e-92783e6a741a.png" alt="Portrait Only" />
</p>


<p align="center">
<img src="https://user-images.githubusercontent.com/30001806/100485179-d1d71d00-3107-11eb-9f72-60fe20e16f05.png" alt="Rotation" />
</p>


## Getting Started


Create routes and set their orientation:

``` dart
class AppRoutes {
  // has defaultOrientation
  static var home = RouteDetails(
    name: 'home',
    page: HomePage(),
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



#### Setup OrientationHelper:

   ``` dart

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  OrientationHelper orientationHelper;

  @override
  void initState() {
    orientationHelper = OrientationHelper(
      routes: AppRoutes.routes,
      defaultOrientation: ScreenOrientation.portraitOnly,
    );
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

Navigate with pushNamed:
``` dart
Navigator.of(context).pushNamed(AppRoutes.details.name);
```

#### Pass arguments:
```dart 
Navigator.of(context).pushNamed(AppRoutes.details.name, arguments: 'Argument');
```

Get arguments:
```dart
class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        final dynamic arguments = (ModalRoute.of(context).settings.arguments as RouteArguments).args;
    return Child();
  }
}
```
