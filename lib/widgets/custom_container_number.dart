import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/constants.dart';

Widget customContainerNumber({BuildContext context, Widget country,}) {
  return Container(
    width: 65.w,
    height: 45.h,
    decoration: BoxDecoration(
      color: dark_red,
      borderRadius: BorderRadius.circular(25.r),
    ),
    child: country,
  );
}
