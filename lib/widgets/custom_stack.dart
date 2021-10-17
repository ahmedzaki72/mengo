import 'package:flutter/material.dart';
import 'package:mengo/widgets/custom_avatar_without_adding.dart';
import 'package:mengo/widgets/custom_cotainer_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customStack({
  BuildContext context,
  Widget column,
  String image,
  Function onTap,
}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      customContainerShadow(
        width: 330.w,
        height: 500.h,
        context: context,
        child: Container(
          child: column,
        ),
      ),
      Positioned(
        top: -50.h,
        left: 120.w,
        child: GestureDetector(
          onTap: onTap,
          child: customAvatarWithAdding(
            context: context,
            image: image,
            radius1: 50.r,
            radius2: 47.r,
          ),
        ),
      ),
    ],
  );
}
