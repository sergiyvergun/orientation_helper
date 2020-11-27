import 'package:flutter/material.dart';
import 'package:orientation_helper/models/screen_orientation.dart';

class RouteDetails {
  final String name;
  final Widget page;
  final ScreenOrientation orientation;

  RouteDetails({
    @required this.name,
    @required this.page,
    this.orientation = ScreenOrientation.portraitOnly,
  });
}