import 'package:flutter_compass_plus/compass_event.dart';

import 'flutter_compass_plus_platform_interface.dart';

class FlutterCompassPlus {
  static final FlutterCompassPlus _instance = FlutterCompassPlus._();

  FlutterCompassPlus._();

  factory FlutterCompassPlus() => _instance;

  Stream<CompassEvent>? getEvents() {
    return FlutterCompassPlusPlatform.instance.getEvents();
  }
}
