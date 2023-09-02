import 'package:flutter/material.dart';
import 'package:flutter_compass_plus/compass_event.dart';
import 'package:flutter_compass_plus/flutter_compass_plus.dart';

class RawData extends StatefulWidget {
  const RawData({super.key});

  @override
  State<RawData> createState() => _RawDataState();
}

class _RawDataState extends State<RawData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: StreamBuilder<CompassEvent>(
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

          CompassEvent event = snapshot.data!;

          // if direction is null, then device does not support this sensor
          // show error message
          if (event.heading == null) {
            return const Center(
              child: Text("Sensors are not available !"),
            );
          }
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Heading:',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    event.heading!.toStringAsFixed(2),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Camera Heading:',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    event.headingForCameraMode!.toStringAsFixed(2),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ],
          );

          // return Material(
          //   shape: const CircleBorder(),
          //   clipBehavior: Clip.antiAlias,
          //   elevation: 4.0,
          //   child: Container(
          //     padding: const EdgeInsets.all(16.0),
          //     alignment: Alignment.center,
          //     decoration: const BoxDecoration(
          //       shape: BoxShape.circle,
          //     ),
          //     child: Transform.rotate(
          //       angle: (direction * (pi / 180) * -1),
          //       child: const Icon(
          //         Icons.navigation_outlined,
          //         size: 100,
          //       ),
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}
