import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:pokedex/core/routes/pages.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginController extends GetxController {
  var loginText = 'Continuar'.obs;
  var duration = const Duration(seconds: 2);
  var rondButton = RoundedLoadingButtonController().obs;

  var name = TextEditingController(text: '').obs;
  final nameShared = const FlutterSecureStorage();

  var validateUser = false.obs;
  var validate = false.obs;
  var menssageError = "".obs;

  @override
  void onClose() {
    super.onClose();
    rondButton.close();
  }

  startTime() async {
    validateUser.value = false;
    validate.value = false;
    rondButton.value.start();
    return validationEditext();
  }

  validationEditext() {
    if (name.value.text.isEmpty) {
      menssageError.value = "Campos vacios";
      validateUser.value = true;
      rondButton.value.error();
      return validateUser.value = true;
    }

    singIn();
  }

  singIn() async {
    nameShared.write(key: 'nameUser', value: name.value.text);
    Get.offAllNamed(Routes.main);
  }
}
