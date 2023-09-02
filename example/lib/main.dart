import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_compass_plus/compass_event.dart';
import 'package:flutter_compass_plus/flutter_compass_plus.dart';
import 'package:flutter_compass_plus_example/widgets/raw_data.dart';
import 'package:permission_handler/permission_handler.dart';

import 'widgets/permission_sheet.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _hasPermissions = false;

  void _fetchPermissionStatus() {
    Permission.locationWhenInUse.status.then((status) {
      if (mounted) {
        setState(() => _hasPermissions = status == PermissionStatus.granted);
      }
    });
  }

  void _requestPermission() {
    Permission.locationWhenInUse.request().then((_) {
      _fetchPermissionStatus();
    });
  }

  @override
  void initState() {
    _requestPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Compass Plus'),
        ),
        body: Builder(builder: (context) {
          if (_hasPermissions) {
            return Column(
              children: <Widget>[
                const RawData(),
                Expanded(child: _buildCompass()),
              ],
            );
          }
          return const PermissionSheet();
        }),
      ),
    );
  }

  Widget _buildCompass() {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompassPlus().getEvents(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error reading heading: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        double? direction = snapshot.data!.heading;

        // if direction is null, then device does not support this sensor
        // show error message
        if (direction == null) {
          return const Center(
            child: Text("Device does not have sensors !"),
          );
        }

        return Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Transform.rotate(
              angle: (direction * (math.pi / 180) * -1),
              child: const Icon(
                Icons.navigation_outlined,
                size: 100,
              ),
            ),
          ),
        );
      },
    );
  }
}
