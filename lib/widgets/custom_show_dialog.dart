import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:mengo/widgets/custom_button_theme.dart';

void showAlertDialog({
  BuildContext context,
  Color pickerColor,
  Function(Color) onChangeColor,
}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick A Color'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ColorPicker(
                  pickerColor: pickerColor,
                  onColorChanged: onChangeColor,
                  showLabel: true,
                  pickerAreaHeightPercent: 0.8,
                ),
                customButtonTheme(
                    context: context,
                    title: 'Save',
                    function: () {
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          ),
        );
      });
}
