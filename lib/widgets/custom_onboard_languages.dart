import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mengo/constants.dart';

Widget customOnBoardingLanguages({
  BuildContext context,
}) {
  return Container(
    width: 160.w,
    height: 40.h,
    decoration: BoxDecoration(
      color: lan_color,
      borderRadius: BorderRadius.circular(30.r),
    ),
    child: Row(
      children: [
        GestureDetector(
          onTap: (){
            translator.setNewLanguage(context,
                remember: true,
                restart: true,
                newLanguage:
                translator.currentLanguage == 'ar' ? 'en' : 'ar');
          },
          child: Container(
            width: 70.w,
            decoration: BoxDecoration(
              color: lan_color,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Center(
              child: Text(
                'العربيه',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: dark_red,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            translator.setNewLanguage(context,
                remember: true,
                restart: true,
                newLanguage:
                translator.currentLanguage == 'en' ? 'ar' : 'en');
          },
          child: Container(
            width: 90.w,
            decoration: BoxDecoration(
              color: red_color,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Center(
              child: Text(
                'English',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
