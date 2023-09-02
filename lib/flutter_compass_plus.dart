
import 'flutter_compass_plus_platform_interface.dart';

class FlutterCompassPlus {
  Future<String?> getPlatformVersion() {
    return FlutterCompassPlusPlatform.instance.getPlatformVersion();
  }
}
