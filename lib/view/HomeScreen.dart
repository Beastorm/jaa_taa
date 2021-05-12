import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jaa_taa/commonComponet/AppColors.dart';
import 'package:jaa_taa/controller/CategoryController.dart';
import 'package:jaa_taa/view/PostListScreen.dart';
import 'package:jaa_taa/view/SearchScreen.dart';
import 'package:jaa_taa/view/TermsScreen.dart';
import 'package:jaa_taa/view/ViewAllCategory.dart';
import 'package:jaa_taa/view/ViewSavePost.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'PrivacyView.dart';

class HomeScreen extends StatelessWidget {
  CategoryController categoryController = Get.put(CategoryController());
  final box = GetStorage();
  static const _url = 'https://play.google.com/store/apps/details?id=com.jaataa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(child: getDrawer()),
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                showSearch(context: context, delegate: DataSeacrch());
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.search),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.notifications),
            ),
            SizedBox(width: 10)
          ],
          title: Text(
            'Jaa-Taa',
            style: TextStyle(color: AppColors.black),
          ),
          backgroundColor: AppColors.themeColorLight,
        ),
        body: LimitedBox(
          maxHeight: double.infinity,
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('   To Categories',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  InkWell(
                      onTap: () {
                        Get.to(ViewAllCategory());
                      },
                      child: Text(
                        'View all    ',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600),
                      ))
                ],
              ),
              GetX<CategoryController>(
                initState: (context) {},
                builder: (controller) {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: new List<Widget>.generate(
                          controller.categoryList.length, (index) {
                        return InkWell(
                          onTap: () {
                            print(
                                'category Id: ${controller.categoryList[index].id}');
                            Get.to(PostListScreen(
                                controller.categoryList[index].id));
                          },
                          child: new GridTile(
                            child: new Card(
                                margin: EdgeInsets.all(10),
                                child: new Center(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10.0),
                                      Expanded(
                                          child: Image.network(controller
                                              .categoryList[index].image)),
                                      SizedBox(height: 10.0),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 15),
                                        child: Text(
                                          controller.categoryList[index].name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        );
                      }),
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    child: Container(
                        color: Colors.tealAccent,
                        child: Image.asset('assets/images/banner.png'))),
              )
            ],
          ),
        ));
  }

  Widget getDrawer() {
    String userName = box.read('name');
    String email = box.read('email');
    return ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(userName),
          accountEmail: Text(email),
          currentAccountPicture: CircleAvatar(
            backgroundColor: AppColors.white,
            child: Icon(Icons.person),
          ),
        ),
        ListTile(
          onTap: () {
            Get.to(ViewSavePost());
          },
          title: Text('Save post'),
          leading: Icon(Icons.save),
        ),
        ListTile(
          onTap: () {
            Get.to(Privacy());
          },
          title: Text('Privacy & policy'),
          leading: Icon(Icons.policy),
        ),
        ListTile(
          onTap: (){
            Get.to(TermsView());
          },
          title: Text('Terms & condition'),
          leading: Icon(Icons.branding_watermark_sharp),
        ),
        ListTile(
          onTap: (){
            Share.share('Download our app \n\nhttps://play.google.com/store/apps/details?id=com.jaataa');
          },
          title: Text('Share app'),
          leading: Icon(Icons.share),
        ),
        ListTile(
          onTap: (){
            _launchURL();
          },
          title: Text('Rate us'),
          leading: Icon(Icons.star_rate),
        )
      ],
    );
  }

  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}
