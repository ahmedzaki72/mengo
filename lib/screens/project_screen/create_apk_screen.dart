import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/screens/project_screen/project_screen.dart';
import 'package:mengo/widgets/custom_container_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/widgets/custom_cotainer_shadow.dart';
import 'package:mengo/widgets/custom_header.dart';

class CreateApkScreen extends StatelessWidget {
  static const String routeName = "create_apk_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: customContainerBackground(
            context: context,
            image: 'assets/images/bg.jpeg',
            child: SingleChildScrollView(
              child: Column(
                children: [
                  customHeader(context: context),
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 200.w,
                    height: 100.w,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  customContainerShadow(
                    context: context,
                    width: 330.w,
                    height: 500.h,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Text(
                          translator.translate('building'),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                            color: dark_red,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CircleAvatar(
                          backgroundColor: dark_red,
                          radius: 90.r,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 86.r,
                            child: Image(
                              image: AssetImage(
                                  'assets/images/hammer-icon-1155338625475qiewdnsd.png'),
                              width: 100.w,
                              height: 100.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          'Building Downloading Apk File',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: dark_red,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: dark_red,
                              radius: 30.r,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 26.r,
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/140405266-creative-dog-cat-pet-house-logo-design-vector-template.png'),
                                  width: 50.w,
                                  height: 50.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w,),
                            GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, ProjectScreen.routeName);
                              },
                              child: Container(
                                width: 220.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: dark_red,
                                  borderRadius: BorderRadius.circular(30.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
