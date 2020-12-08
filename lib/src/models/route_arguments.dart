import '../../orientation_helper.dart';

class RouteArguments {
  final ScreenOrientation orientation;
  final dynamic args;

  RouteArguments(this.args, {this.orientation});
}
