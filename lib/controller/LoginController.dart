import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jaa_taa/apiModule/LoginApi.dart';
import 'package:jaa_taa/commonComponet/MyAlertDialog.dart';
import 'package:jaa_taa/commonComponet/MySnackbar.dart';
import 'package:jaa_taa/view/Pages.dart';

class LoginController extends GetxController {
  MyAlertDialog myAlertDialog = MyAlertDialog();
  var emailTextController = new TextEditingController();
  var passwordTextController = new TextEditingController();
  final box = GetStorage();

  getLoginFormValue() async {
    //Alert dilog
    myAlertDialog.alertDialog(
        'Please wait', 'We are checking login credentials');

    print(
        'Email ${emailTextController.text}, Password ${passwordTextController.text}');

    var loginResponse = await LoginApi.login(
        emailTextController.text.trim(), passwordTextController.text.trim());

    print('login controller response: ${loginResponse.response}');
    if (loginResponse != null) {
      if (loginResponse.response == 'True') {
        String userId = loginResponse.data.userid;
        String mobile = loginResponse.data.mobile;
        String name = loginResponse.data.name;
        String email = loginResponse.data.email;

        print('userid: $userId, mobile: $mobile, name: $name, email: $email');

        box.write('loginStatus', 'true');
        box.write('userId', userId);
        box.write('mobile', mobile);
        box.write('name', name);
        box.write('email', email);
        //
        // print('Teacherid: $teacherId');
        print('user id ${loginResponse.data.id}');

        Get.offAll(PagesScreen());
        MySnackbar.successSnackBar('Success', 'Login successfully done');
      } else {
        MySnackbar.errorSnackBar(
            'Login failed', 'Please check the credentials');
      }
    }
  }
}
