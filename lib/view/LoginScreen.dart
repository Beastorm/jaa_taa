import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jaa_taa/commonComponet/AppColors.dart';
import 'package:jaa_taa/controller/LoginController.dart';
import 'package:jaa_taa/view/SignupScreen.dart';

import 'Pages.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
      body: (Stack(
        children: [
          Positioned(
            left: 0.0,
            child: SvgPicture.asset('assets/images/loginbg.svg'),
          ),
          Container(
            margin: EdgeInsets.only(top: 110.0),
            child: ListView(
              children: [
                
                //Email TextField
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 100.0),
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 70.0),
                        child: TextFormField(
                          // validator: (textvalue){
                          //   //return textvalue.contains(other)
                          // },
                            controller: loginController.emailTextController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              labelText: 'Enter Email',
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: AppColors.black,
                                fontWeight: FontWeight.w300,
                                // light
                                fontStyle: FontStyle.normal,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: AppColors.themeColor)),
                            )),
                      ),

                      //Password TextField
                      Container(
                        height: 50,
                        margin:
                            EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
                        child: TextFormField(
                            controller: loginController.passwordTextController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              labelText: 'Enter Password',
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: AppColors.black,
                                fontWeight: FontWeight.w300,
                                // light
                                fontStyle: FontStyle.normal,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: AppColors.themeColor)),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.0),
//Login button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'New to Jaa-Taa?',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                              color: AppColors.black),
                        ),
                        RaisedButton(
                            color: AppColors.offWhite,
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.themeColorLight),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(6.0)),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                Get.to(Signup());
                              }

                              // Get.offAll(HomePage());

                              // print('Email: '+.text+" "+'Password: '+_passwordTextController.text);
                            }),
                      ],
                    ),
                    SizedBox(width: 100),
                    Column(
                      children: [
                        Text(
                          '',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                              color: AppColors.black),
                        ),
                        RaisedButton(
                            color: AppColors.themeColorLight,
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.white),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(6.0)),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                loginController.getLoginFormValue();
                              }

                              // Get.offAll(HomePage());

                              // print('Email: '+.text+" "+'Password: '+_passwordTextController.text);
                            }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
