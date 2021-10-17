import 'package:flutter/material.dart';
import 'package:mengo/widgets/custom_avatar_without_adding.dart';
import 'package:mengo/widgets/custom_button_back.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customHeader({BuildContext context}) {
  return Padding(
    padding: EdgeInsets.only(
      top: 5.h,
      left: 8.w,
      right: 8.w,
    ),
    child: Row(
      children: [
        customButtonBack(context: context),
        Spacer(),
        customAvatarWithAdding(
          context: context,
          image:
              'https://images.pexels.com/photos/1987301/pexels-photo-1987301.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          radius1: 20.r,
          radius2: 18.r,
        ),
      ],
    ),
  );
}
