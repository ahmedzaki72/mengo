import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/screens/commericial_screen/cubit/commercial_cubit.dart';
import 'package:mengo/screens/commericial_screen/cubit/commercial_states.dart';
import 'package:mengo/screens/project_screen/create_apk_screen.dart';
import 'package:mengo/widgets/custom_button_theme.dart';
import 'package:mengo/widgets/custom_circle_colors.dart';
import 'package:mengo/widgets/custom_container_background.dart';
import 'package:mengo/widgets/custom_cotainer_shadow.dart';
import 'package:mengo/widgets/custom_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/widgets/custom_images_upload.dart';
import 'package:mengo/widgets/custom_show_dialog.dart';
import 'package:mengo/widgets/cutom_text_form.dart';
import 'package:toast/toast.dart';




class CommericialSingleServiceScreen extends StatefulWidget {
  static const String routeName = "Commericial_single_service_screen";

  @override
  _CommericialSingleServiceScreenState createState() => _CommericialSingleServiceScreenState();
}

class _CommericialSingleServiceScreenState extends State<CommericialSingleServiceScreen> {
  File image;
  String title, text;
  Color titleColor = Color(0xffd98025);
  Color textColor = Color(0xffd98025);


  final picker = ImagePicker();

  Future getImages() async {
    final pickerFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        image = File(pickerFile.path);
      } else {
        Toast.show(
          'no_images_select',
          context,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.BOTTOM,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:customContainerBackground(
        context: context,
        image: 'assets/images/bg.jpeg',
        child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  customHeader(context: context),
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 200.w,
                    height: 100.w,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  customContainerShadow(
                    context: context,
                    width: 330.w,
                    height: 500.h,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Text(
                              'Commercial Single service',
                              style: TextStyle(color: dark_red, fontSize: 16.sp),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomTextFormField(
                            hintText: 'Title',
                            onChanged: (value) {
                              title = value;
                            },
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomTextFormField(
                            hintText: 'text',
                            onChanged: (value) {
                              text = value;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          customImage(
                            name: 'UploadImage',
                            image: image,
                            onTap: getImages,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              customCircleColor(
                                  onTap: () {
                                    showAlertDialog(
                                        context: context,
                                        pickerColor: titleColor,
                                        onChangeColor: (value) {
                                          setState(() {
                                            titleColor = value;
                                          });
                                        });
                                  },
                                  color: titleColor,
                                  name: 'TitleColor'),
                              customCircleColor(
                                  name: 'TextColor',
                                  color: textColor,
                                  onTap: () {
                                    showAlertDialog(
                                        context: context,
                                        pickerColor: textColor,
                                        onChangeColor: (value) {
                                          setState(() {
                                            textColor = value;
                                          });
                                        });
                                  }),
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          BlocConsumer<CommercialCubit, CommercialStates>(
                            listener: (context, states) {
                              if(states is CommercialSingleServiceSuccessStates) {
                                if(states.commercialSingleService.commercialResponse.status == '200') {
                                  Navigator.pushNamed(context, CreateApkScreen.routeName);
                                }
                              }
                            },
                            builder: (context, states) {
                              var cubit = CommercialCubit.get(context);
                              if(states is!  CommercialSingleServiceLoadingStates) {
                                return   customButtonTheme(
                                    context: context,
                                    title: "Save",
                                    function: () {
                                      cubit.addingCommercialSingleService(
                                        title: title,
                                        titleColor: titleColor.toString(),
                                        text: text,
                                        textColor: textColor.toString(),
                                        image: image,
                                      );
                                    });
                              }else {
                                return spinKit;
                              }

                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
