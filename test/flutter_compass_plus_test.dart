import 'package:flutter_compass_plus/compass_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_compass_plus/flutter_compass_plus.dart';
import 'package:flutter_compass_plus/flutter_compass_plus_platform_interface.dart';
import 'package:flutter_compass_plus/flutter_compass_plus_event_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterCompassPlusPlatform
    with MockPlatformInterfaceMixin
    implements FlutterCompassPlusPlatform {
  @override
  Stream<CompassEvent> getEvents() => Stream.fromIterable([
        CompassEvent.fromList([0, 0, 0]),
      ]);
}

void main() {
  final FlutterCompassPlusPlatform initialPlatform =
      FlutterCompassPlusPlatform.instance;

  test('$EventChannelFlutterCompassPlus is the default instance', () {
    expect(initialPlatform, isInstanceOf<EventChannelFlutterCompassPlus>());
  });

  test('getPlatformVersion', () async {
    FlutterCompassPlus flutterCompassPlusPlugin = FlutterCompassPlus();
    MockFlutterCompassPlusPlatform fakePlatform =
        MockFlutterCompassPlusPlatform();
    FlutterCompassPlusPlatform.instance = fakePlatform;

    expect(await flutterCompassPlusPlugin.getEvents(), '42');
  });
}
