import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionSheet extends StatelessWidget {
  const PermissionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Location Permission Required'),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('Open App Settings'),
            onPressed: () {
              openAppSettings();
            },
          )
        ],
      ),
    );
  }
}
