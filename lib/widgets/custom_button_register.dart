import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mengo/constants.dart';

Widget customButtonRegister({BuildContext context, Function function}) {
  return GestureDetector(
    onTap: function,
    child: Container(
      width: 300.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              translator.translate('signIn'),
              style: TextStyle(
                color: dark_red,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.phone_outlined,
              color: dark_red,
            ),
          ],
        ),
      ),
    ),
  );
}
