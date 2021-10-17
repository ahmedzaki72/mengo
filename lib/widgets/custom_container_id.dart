import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/constants.dart';

Widget customContainerId({
  BuildContext context,
  Widget child,
}) {
  return Container(
    width: 240.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: dark_red,
      borderRadius: BorderRadius.circular(25.0.r),
    ),
    child: child,
  );
}
