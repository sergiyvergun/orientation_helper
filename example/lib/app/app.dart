import 'package:flutter/material.dart';
import 'package:orientation_helper/orientation_helper.dart';

import 'routes.dart';

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
      debugShowCheckedModeBanner: false,

      initialRoute: AppRoutes.home.name,

      /// Setup OrientationHelper
      navigatorObservers: [
        orientationHelper.navigatorObserver,
      ],
      onGenerateRoute: orientationHelper.onGenerateRoute,
    );
  }
}
