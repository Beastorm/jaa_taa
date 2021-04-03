import 'package:flutter/material.dart';
import 'package:jaa_taa/commonComponet/AppColors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Jaa-Taa', style: TextStyle(color: AppColors.black),),
      backgroundColor: AppColors.themeColorLight,
      leading: Icon(Icons.menu),
    ));
  }
}
