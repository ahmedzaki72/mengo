import 'package:flutter/material.dart';
import 'package:mengo/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownList extends StatefulWidget {
  final List<String> dropdownList;
  String dropdownValue;
  Function(String) onChange;
  CustomDropdownList({
    this.dropdownList,
    this.dropdownValue,
    this.onChange,
  });
  @override
  _CustomDropdownListState createState() => _CustomDropdownListState();
}

class _CustomDropdownListState extends State<CustomDropdownList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210.w,
      padding: EdgeInsets.only(
        right: 15.w,
        left: 15.w,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: dark_red, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton(
        isExpanded: true,
        value: widget.dropdownValue,
        underline: Container(),
        style: TextStyle(color: dark_red),
        icon: Icon(Icons.arrow_drop_down_outlined),
        iconSize: 24.sp,
        elevation: 16,
        onChanged: widget.onChange,
        items: widget.dropdownList.map<DropdownMenuItem<String>>((String e) {
          return DropdownMenuItem(
            child: Text(e),
            value: e,
          );
        }).toList(),
      ),
    );
  }
}
