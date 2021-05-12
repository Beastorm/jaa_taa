import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaa_taa/commonComponet/AppColors.dart';
import 'package:jaa_taa/view/Pages.dart';

class PostAddedSuccess extends StatelessWidget {
  const PostAddedSuccess({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Successfully posted',
              style: TextStyle(fontSize: 20, color: AppColors.themeColor),
            ),
            SizedBox(height: 20),
            Text(
              'Please wait for the admin approval',
              style: TextStyle(fontSize: 16, color: Colors.deepPurple),
            ),
            SizedBox(height: 20),
            Text(
              'The post will be visible once admin approved your post',
              style: TextStyle(fontSize: 12, color: Colors.teal),
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () {
                Get.off(PagesScreen());
              },
              child: Text(
                'Back to Home',
                style: TextStyle(color: AppColors.white),
              ),
              color: AppColors.themeColor,
            )
          ],
        ),
      )),
    );
  }
}
