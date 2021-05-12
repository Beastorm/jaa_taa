import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jaa_taa/commonComponet/AppColors.dart';
import 'package:jaa_taa/view/LoginScreen.dart';

class ProfileScreen extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColorLight,
        title: Text('Profile'),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_outlined),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/profile.png',
                      height: 60, width: 60),
                ],
              ),
            ),
            Container(margin: EdgeInsets.only(top: 10), child: Text('Name')),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: 280.0,
              height: 320.0,
              child: Card(
                elevation: 8,
                child: Column(
                  children: [
                    //   box.write('userId', userId);
                    //         box.write('mobile', mobile);
                    //         box.write('name', name);
                    //         box.write('email', email);

                    Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Text('Name : ${box.read('name')}')),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text('Name : ${box.read('email')}')),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text('Name : ${box.read('mobile')}')),
                    SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 20),
                        Expanded(
                          child: RaisedButton(
                            color: Colors.red,
                            child: Text(
                              'Log out',
                              style: TextStyle(color: AppColors.white),
                            ),
                            onPressed: () {
                              box.erase();
                              Get.offAll(LoginScreen());
                            },
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: RaisedButton(
                            color: Colors.amber,
                            child: Text('Edit profile',
                                style: TextStyle(color: AppColors.white)),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
