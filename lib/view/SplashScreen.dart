import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jaa_taa/commonComponet/AppColors.dart';
import 'package:jaa_taa/view/HomeScreen.dart';
import 'package:jaa_taa/view/IntroScreen.dart';
import 'package:jaa_taa/view/LoginScreen.dart';
import 'package:jaa_taa/view/Pages.dart';

class SplashScreen extends StatelessWidget {
  final box = GetStorage();


  @override
  Widget build(BuildContext context) {
    String loginStatus = box.read('loginStatus');
    // String userId = box.read('userId');
    // String name = box.read('name');
    // String mobile = box.read('mobile');
    // String email = box.read('email');


    // box.write('loginStatus', 'true');
    // box.write('userId', userId);
    // box.write('mobile', mobile);
    // box.write('name', name);
    // box.write('email', email);

    Timer(Duration(seconds: 4), () {
      print('Loginstatus : $loginStatus');
      // print('userid : $userId');
      // print('name : $name');

     if (loginStatus == null) {
        Get.offAll(IntroScreen());
      } else {
        Get.offAll(PagesScreen());
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
                Text('Jaa-Taa',
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
