import 'package:flutter/material.dart';

class ProgressPrimary extends StatelessWidget {
  const ProgressPrimary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loading(context);
  }

  Widget loading(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/loading.gif"),
            Text(
              "Espera un momento...",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}
