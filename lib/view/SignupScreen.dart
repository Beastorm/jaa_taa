import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jaa_taa/commonComponet/AppColors.dart';
import 'package:jaa_taa/controller/RegisterController.dart';
import 'package:jaa_taa/view/HomeScreen.dart';

class Signup extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (Stack(
        children: [
          Positioned(
            left: 0.0,
            child: SvgPicture.asset('assets/images/signupbg.svg'),
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

                      //Name TextField
                      Container(
                        height: 50,
                        margin:
                            EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
                        child: TextFormField(
                            controller: registerController.nameTextController,
                            decoration: InputDecoration(
                              hintText: 'Name',
                              labelText: 'Enter Name',
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

                      //Mobile TextField
                      Container(
                        height: 50,
                        margin:
                            EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
                        child: TextFormField(
                            controller: registerController.mobileTextController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Mobile',
                              labelText: 'Enter Mobile',
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

                      Container(
                        height: 50,
                        margin:
                            EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
                        child: TextFormField(
                            controller: registerController.emailTextController,
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
                            controller:
                                registerController.passwordTextController,
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
                          'Having account?',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                              color: AppColors.black),
                        ),
                        RaisedButton(
                            color: AppColors.offWhite,
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.themeColorLight),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(6.0)),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {}

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
                              'SIGN UP',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.white),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(6.0)),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                registerController.getRegister();
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
          )
        ],
      )),
    );
  }
}
