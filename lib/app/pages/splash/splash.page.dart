import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash.controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Theme.of(context).scaffoldBackgroundColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/splash.gif').paddingOnly(top: 20),
              _animatedText(context).paddingOnly(top: 25)
            ],
          ),
        ),
      ),
    );
  }

  Widget _animatedText(BuildContext context) {
    return Obx(() {
      return AnimatedOpacity(
        opacity: controller.fadeText.value ? 1.0 : 0.0,
        duration: const Duration(seconds: 2),
        child: Text(
          '${controller.nameCorporation}',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      );
    });
  }
}
