import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.controller.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Obx(() {
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/ash_login.png',
                height: 250,
              ),
              _text(context, "Ingresa Tú Nombre").paddingOnly(top: 20),
              _name(controller.name.value, context)
                  .paddingOnly(left: 15, right: 15, top: 30),
              _containButton(context).paddingOnly(top: 30),
            ],
          ).paddingOnly(
            top: MediaQuery.of(context).size.height * 0.050,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).size.height * 0.050,
          ),
        ),
      );
    })));
  }

  Widget _text(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }

  TextField _name(TextEditingController control, BuildContext context) {
    return TextField(
      obscureText: false,
      controller: control,
      keyboardType: TextInputType.emailAddress,
      cursorColor: Theme.of(context).primaryColor,
      style: Theme.of(context).textTheme.bodyText2,
      decoration: InputDecoration(
        errorText: controller.validateUser.value
            ? controller.menssageError.value
            : null,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(Icons.person, color: Colors.grey[700]),
        labelStyle:
            Theme.of(context).textTheme.subtitle2!.apply(color: Colors.black54),
        labelText: "Nombre",
        hintText: "Ingresa un Nombre",
        hintStyle:
            Theme.of(context).textTheme.bodyText2!.apply(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red[200]!),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange, width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _containButton(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 40, right: 40),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          border: Border.all(
            style: BorderStyle.solid,
            color: Colors.white,
          ),
        ),
        child: RoundedLoadingButton(
          height: MediaQuery.of(context).size.height * 0.065,
          controller: controller.rondButton.value,
          onPressed: () => controller.startTime(),
          resetAfterDuration: true,
          resetDuration: const Duration(seconds: 3),
          color: Theme.of(context).primaryColor,
          errorColor: Colors.red,
          child: Text('${controller.loginText}',
              style: Theme.of(context).textTheme.button),
        ));
  }
}
