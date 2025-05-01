import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'ble_setup.dart';

QualifiedCharacteristic characteristic(String deviceId, String serviceUuid, String charUuid) {
  return QualifiedCharacteristic(
    deviceId: deviceId,
    serviceId: Uuid.parse(serviceUuid),
    characteristicId: Uuid.parse(charUuid),
  );
}

Future<List<int>> readData(QualifiedCharacteristic c) async {
  return await ble.readCharacteristic(c);
}

Future<void> writeData(QualifiedCharacteristic c, List<int> value) async {
  await ble.writeCharacteristicWithResponse(c, value: value);
}

Stream<List<int>> subscribe(QualifiedCharacteristic c) {
  return ble.subscribeToCharacteristic(c);
}
