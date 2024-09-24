import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    navigateToOnboarding(context);
    return Scaffold(
      // backgroundColor: Color(0xffffd60a).withOpacity(0.9),
      body: Container(
        decoration: const BoxDecoration(color: Colors.black
            //
            ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height:200.0,
                child: Image(
                  image: AssetImage('images/img.png'),
                ),
              ),
            ),
            SizedBox(
              child: Text(
                "Flickd",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 8.0,
                      color: Colors.white,
                      offset: Offset(2.0, 0.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void navigateToOnboarding(BuildContext context) async {
  // Replace with your desired delay time
  await Future.delayed(const Duration(seconds: 4), () {
    Get.offNamed('/home');
  });
}
