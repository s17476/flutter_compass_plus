import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_compass_plus_platform_interface.dart';

/// An implementation of [FlutterCompassPlusPlatform] that uses method channels.
class MethodChannelFlutterCompassPlus extends FlutterCompassPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_compass_plus');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
