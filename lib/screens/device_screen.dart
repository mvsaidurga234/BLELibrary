import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import '../ble/ble_device_connector.dart';
import '../ble/ble_device_interactor.dart';

class DevicePage extends StatefulWidget {
  final DiscoveredDevice device;
  const DevicePage({super.key, required this.device});

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  late StreamSubscription connectionSub;
  String status = 'Connecting...';

  @override
  void initState() {
    super.initState();
    connectionSub = connectToDevice(widget.device.id).listen((event) {
      setState(() => status = event.connectionState.toString());
    });
  }

  @override
  void dispose() {
    connectionSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.device.name)),
      body: Center(child: Text(status)),
    );
  }
}
