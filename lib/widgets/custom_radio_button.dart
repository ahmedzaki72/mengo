import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/widgets/check_direction.dart';

Widget customRadioButton({
  BuildContext context,
  dynamic value,
  dynamic groupValue,
  Function(dynamic) onChanged,
  String title,
}) {
  return Padding(
    padding: checkDirection(EdgeInsets.only(right: 32.w), EdgeInsets.only(left: 32.w)),
    child: Row(
      children: [
        Radio(
          fillColor: MaterialStateColor.resolveWith(
            (states) => dark_red,
          ),
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(
          translator.translate(title),
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: text_project,
          ),
        ),
      ],
    ),
  );
}
