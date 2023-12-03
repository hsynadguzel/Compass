import 'package:flutter_compass/flutter_compass.dart';
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:torch_light/torch_light.dart';

class CompassController extends GetxController {
  RxDouble degree = 0.0.obs;
  RxDouble tilt = 0.0.obs;
  RxDouble tiltX = 0.0.obs;
  RxDouble tiltY = 0.0.obs;
  RxDouble tiltZ = 0.0.obs;
  RxBool isFlashOn = false.obs;

  @override
  void onInit() {
    FlutterCompass.events!.listen((event) {
      degree.value = event.heading!;
    });
    accelerometerEvents.listen((event) {
      tilt.value = event.y;
    });
    gyroscopeEvents.listen((event) {
      tiltX.value -= event.y;
      tiltY.value += event.x;
      tiltZ.value = event.z;
    });
    super.onInit();
  }

  void toggleFlashlight() {
    if (isFlashOn.value) {
      TorchLight.disableTorch();
    } else {
      TorchLight.enableTorch();
    }
    isFlashOn.toggle();
  }

  @override
  void onClose() {
    TorchLight.disableTorch();
    super.onClose();
  }
}
