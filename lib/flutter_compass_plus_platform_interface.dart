import 'package:flutter_compass_plus/compass_event.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_compass_plus_event_channel.dart';

abstract class FlutterCompassPlusPlatform extends PlatformInterface {
  FlutterCompassPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterCompassPlusPlatform _instance =
      EventChannelFlutterCompassPlus();

  /// The default instance of [FlutterCompassPlusPlatform] to use.
  ///
  /// Defaults to [EventChannelFlutterCompassPlus].
  static FlutterCompassPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterCompassPlusPlatform] when
  /// they register themselves.
  static set instance(FlutterCompassPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Stream<CompassEvent>? getEvents() => _instance.getEvents();
}
