import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jaa_taa/apiModule/LoginApi.dart';
import 'package:jaa_taa/apiModule/RegisterApi.dart';
import 'package:jaa_taa/commonComponet/MyAlertDialog.dart';
import 'package:jaa_taa/commonComponet/MySnackbar.dart';
import 'package:jaa_taa/view/LoginScreen.dart';
import 'package:jaa_taa/view/Pages.dart';

class RegisterController extends GetxController {
  MyAlertDialog myAlertDialog = MyAlertDialog();

  var nameTextController = new TextEditingController();
  var mobileTextController = new TextEditingController();
  var emailTextController = new TextEditingController();
  var passwordTextController = new TextEditingController();

  final box = GetStorage();

  getRegister() async {
    //Alert dilog
    myAlertDialog.alertDialog(
        'Please wait', 'We are checking login credentials');

    print('Name ${nameTextController.text}, Mobile ${mobileTextController.text}'
        'Email ${emailTextController.text}, Password ${passwordTextController.text}');


    var response = await RegisterApi.register(
        nameTextController.text.trim(),
        mobileTextController.text.trim(),
        emailTextController.text.trim(),
        passwordTextController.text.trim());

    print('register controller response: ${response.response}');
    if (response != null) {
      if (response.response == 'True') {
        Get.offAll(LoginScreen());
        MySnackbar.successSnackBar('Success', 'Register successfully done');
      }
      else if (response.msg == 'User Already Exits') {
        Get.back();
        MySnackbar.infoSnackBar(
            'Already exist', 'Please try with differnt email and number');
      } else {
        Get.back();
        MySnackbar.errorSnackBar(
            'Register failed', 'Server error, please try again later');
      }
    }
  }
}
