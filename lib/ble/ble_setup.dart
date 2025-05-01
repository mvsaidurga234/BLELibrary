import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:permission_handler/permission_handler.dart';

final FlutterReactiveBle ble = FlutterReactiveBle();

Future<void> setupBle() async {
  await [
    Permission.bluetooth,
    Permission.location,
  ].request();
}
