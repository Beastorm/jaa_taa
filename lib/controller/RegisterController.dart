import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jaa_taa/apiModule/LoginApi.dart';
import 'package:jaa_taa/commonComponet/MyAlertDialog.dart';
import 'package:jaa_taa/commonComponet/MySnackbar.dart';
import 'package:jaa_taa/view/Pages.dart';

class RegisterController extends GetxController {
  MyAlertDialog myAlertDialog = MyAlertDialog();

  var nameTextController = new TextEditingController();
  var mobileTextController = new TextEditingController();
  var emailTextController = new TextEditingController();
  var passwordTextController = new TextEditingController();

  final box = GetStorage();

  getLoginFormValue() async {
    //Alert dilog
    myAlertDialog.alertDialog(
        'Please wait', 'We are checking login credentials');

    print('Name ${nameTextController.text}, Mobile ${mobileTextController.text}'
        'Email ${emailTextController.text}, Password ${passwordTextController.text}');


    var response = await LoginApi.login(emailTextController.text.trim(), passwordTextController.text.trim());

    print('login controller response: ${response.response}');
    if (response != null) {

      if (response.response == 'True') {
        // String schoolId = loginResponse.data[0];
        // String teacherId =  loginResponse.data[0].id;
        // String name = loginResponse.data[0].name;
        // String email = loginResponse.data[0].email;
        //
        // box.write('loginStatus', 'true');
        // box.write('schoolId', schoolId);
        // box.write('teacherId', teacherId);
        // box.write('name', name);
        // box.write('email', email);
        //
        // print('Teacherid: $teacherId');
        print('user id ${loginResponse.data.id}');

        Get.offAll(PagesScreen());
        MySnackbar.successSnackBar('Success', 'Register successfully done');
      } else {
        MySnackbar.errorSnackBar(
            'Login failed', 'Please check the credentials');

      }
    }
  }
}
