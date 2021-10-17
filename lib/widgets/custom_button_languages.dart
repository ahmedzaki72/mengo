import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/widgets/custom_container_langugages.dart';

Widget customButtonLanguages({BuildContext context}) {
  return Container(
    width: 220.w,
    height: 45.h,
    decoration: BoxDecoration(
      color: dark_red,
      borderRadius: BorderRadius.circular(30.r),
    ),
    child: Row(
      children: [
        customContainerLanguages(
            context: context,
            color:  lan_color,
            color1: dark_red,
            title: 'العربيه',
            function: () {
              translator.setNewLanguage(context,
                  remember: true,
                  restart: true,
                  newLanguage:
                      translator.currentLanguage == 'ar' ? 'en' : 'ar');
            }),
        customContainerLanguages(
            context: context,
            color: dark_red,
            color1: Colors.white,
            title: 'English',
            function: () {
              translator.setNewLanguage(context,
                  remember: true,
                  restart: true,
                  newLanguage:
                  translator.currentLanguage == 'en' ? 'ar' : 'en');
            }),
      ],
    ),
  );
}
