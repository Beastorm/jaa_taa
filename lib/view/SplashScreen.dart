import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaa_taa/commonComponet/AppColors.dart';
import 'package:jaa_taa/view/HomeScreen.dart';
import 'package:jaa_taa/view/IntroScreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 4), () {
     // if (loginStatus == 'true') {
        Get.offAll(IntroScreen());
      // } else {
      //   Get.offAll(LoginScreen());
      // }
    });

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.themeColor,
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/jaataa.png',
                  width: 120.0,
                  height: 110.0,
                ),
                Text('JAA-TAA',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: AppColors.white,
                        fontWeight: FontWeight.w900
                    )),
              ],
            )),
      ),
    );
  }
}
