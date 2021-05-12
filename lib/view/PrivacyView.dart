import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaa_taa/controller/PrivacyAndTermsController.dart';

class Privacy extends StatelessWidget {
  PrivacyAndTermsController privacyAndTermsController =
      Get.put(PrivacyAndTermsController());

  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
        appBar: AppBar(
          title: Text('Privacy & Policy'),
        ),
        body: LimitedBox(
          maxHeight: double.infinity,
          child: GetX<PrivacyAndTermsController>(initState: (context) {
            privacyAndTermsController.fetchPrivacy();
          }, builder: (controller) {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return SingleChildScrollView(
                child: ListView.builder(
                    itemCount: controller.privacyList.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Card(
                          margin: EdgeInsets.all(10),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Text(controller.privacyList[index].name, style: TextStyle(fontSize: 20),),
                                  SizedBox(height: 20),
                                  Text(controller.privacyList[index].data)
                                ],
                              ),
                            )),
                      );
                    }),
              );
            }
          }),
        ));
  }
}
