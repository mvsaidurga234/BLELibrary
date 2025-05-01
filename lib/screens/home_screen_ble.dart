import 'package:flutter/material.dart';
import '../ble/ble_scanner.dart';
import 'device_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLE Devices')),
      body: StreamBuilder(
        stream: scanDevices(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final device = snapshot.data!;
          return ListTile(
            title: Text(device.name.isEmpty ? '(Unknown)' : device.name),
            subtitle: Text(device.id),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (_) => DevicePage(device: device),
              ));
            },
          );
        },
      ),
    );
  }
}
