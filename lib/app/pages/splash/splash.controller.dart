import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:pokedex/core/routes/pages.dart';

class SplashController extends GetxController {
  var nameCorporation = 'PokeDex'.obs;
  var fadeText = true.obs;

  var duration = const Duration(seconds: 2);

  @override
  void onInit() {
    super.onInit();
    _startTime();
  }

  _startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, fadeOut);
  }

  fadeOut() {
    fadeText.value = false;
    return Timer(duration, fadeIn);
  }

  fadeIn() {
    nameCorporation.value = 'Cargando...';
    fadeText.value = true;
    return Timer(duration, checkName);
  }

  checkName() async {
    final name = await const FlutterSecureStorage().read(key: 'nameUser') ?? '';

    if (name.isNotEmpty) {
      Get.offAllNamed(Routes.main);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }
}
