import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compass_plus/compass_event.dart';

import 'flutter_compass_plus_platform_interface.dart';

class EventChannelFlutterCompassPlus extends FlutterCompassPlusPlatform {
  @visibleForTesting
  final compassEventChannel = const EventChannel('flutter_compass_plus');

  static Stream<CompassEvent>? _stream;

  @override
  Stream<CompassEvent>? getEvents() {
    _stream ??= compassEventChannel
        .receiveBroadcastStream()
        .map((event) => CompassEvent.fromList(event?.cast<double>()));
    return _stream;
  }
}
