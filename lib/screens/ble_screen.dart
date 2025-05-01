final FlutterReactiveBle ble = FlutterReactiveBle();

Future<void> requestPermissions() async {
  await [
    Permission.bluetooth,
    Permission.location,
  ].request();
}
