import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jaa_taa/commonComponet/AppColors.dart';
import 'package:jaa_taa/view/HomeScreen.dart';
import 'package:jaa_taa/view/IntroScreen.dart';
import 'package:jaa_taa/view/LoginScreen.dart';

class SplashScreen extends StatelessWidget {
  final box = GetStorage();


  @override
  Widget build(BuildContext context) {
    String loginStatus = box.read('loginStatus');

    Timer(Duration(seconds: 4), () {
      if (loginStatus == 'true') {
        Get.offAll(HomeScreen());
      } else {
        Get.offAll(LoginScreen());
      }
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
