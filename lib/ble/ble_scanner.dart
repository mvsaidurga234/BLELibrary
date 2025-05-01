import 'dart:async';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'ble_setup.dart';

Stream<DiscoveredDevice> scanDevices() {
  return ble.scanForDevices(withServices: []);
}
