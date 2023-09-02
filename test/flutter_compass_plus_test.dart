import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_compass_plus/flutter_compass_plus.dart';
import 'package:flutter_compass_plus/flutter_compass_plus_platform_interface.dart';
import 'package:flutter_compass_plus/flutter_compass_plus_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterCompassPlusPlatform
    with MockPlatformInterfaceMixin
    implements FlutterCompassPlusPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterCompassPlusPlatform initialPlatform = FlutterCompassPlusPlatform.instance;

  test('$MethodChannelFlutterCompassPlus is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterCompassPlus>());
  });

  test('getPlatformVersion', () async {
    FlutterCompassPlus flutterCompassPlusPlugin = FlutterCompassPlus();
    MockFlutterCompassPlusPlatform fakePlatform = MockFlutterCompassPlusPlatform();
    FlutterCompassPlusPlatform.instance = fakePlatform;

    expect(await flutterCompassPlusPlugin.getPlatformVersion(), '42');
  });
}
