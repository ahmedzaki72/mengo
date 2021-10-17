import 'package:flutter/material.dart';
import 'package:mengo/widgets/custom_container_background.dart';
import 'package:mengo/widgets/custom_cotainer_shadow.dart';
import 'package:mengo/widgets/custom_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AboutScreen extends StatelessWidget {
  static const String routeName = "About_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:customContainerBackground(
        context: context,
        image: 'assets/images/bg.jpeg',
        child: SafeArea(
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
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
