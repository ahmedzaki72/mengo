import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/models/project_models.dart';
import 'package:mengo/screens/commericial_screen/commericial_start_screen.dart';
import 'package:mengo/screens/ecommerce_screen/ecommerce_home_screen.dart';
import 'package:mengo/screens/portfolio_screen/portfolio_start_screen.dart';
import 'package:mengo/screens/project_screen/add_color_screen.dart';
import 'package:mengo/screens/project_screen/create_apk_screen.dart';
import 'package:mengo/screens/project_screen/cubit/new_project_cubit.dart';
import 'package:mengo/screens/project_screen/cubit/new_project_states.dart';
import 'package:mengo/widgets/custom_button_theme.dart';
import 'package:mengo/widgets/custom_container_background.dart';
import 'package:mengo/widgets/custom_container_id.dart';
import 'package:mengo/widgets/custom_cotainer_shadow.dart';
import 'package:mengo/widgets/custom_dorpdown_list.dart';
import 'package:mengo/widgets/custom_header.dart';
import 'package:mengo/widgets/custom_images_upload.dart';
import 'package:mengo/widgets/custom_radio_button.dart';
import 'package:mengo/widgets/cutom_container_project.dart';
import 'package:mengo/widgets/cutom_text_form.dart';
import 'package:toast/toast.dart';

class NewProjectScreen extends StatefulWidget {
  static const String routeName = "newProject_screen";

  @override
  _NewProjectScreenState createState() => _NewProjectScreenState();
}

class _NewProjectScreenState extends State<NewProjectScreen> {
  String radioValue = "admob Ads";
  File _image;
  final picker = ImagePicker();
  File _imageAds;
  String appName;
  String projectType = "Portfolio";
  int projectNumber = 1;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future getImages() async {
    final pickerFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        _image = File(pickerFile.path);
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

  Future getImagesAds() async {
    final pickerFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        _imageAds = File(pickerFile.path);
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
    print(projectNumber);
    return Scaffold(
      body: SafeArea(
        child: customContainerBackground(
          context: context,
          image: 'assets/images/bg.jpeg',
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                    child: Column(
                      children: [
                        SizedBox(
                          height: 55.h,
                        ),
                        Text(
                          translator.translate('new_project'),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                            color: dark_red,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CustomDropdownList(
                          dropdownValue: projectType,
                          onChange: (value) {
                            if (value == "Portfolio") {
                              setState(() {
                                projectType = value;
                                projectNumber = 1;
                              });
                            } else if (value == "Commercial") {
                              setState(() {
                                projectType = value;
                                projectNumber = 2;
                              });
                            } else if (value == "E-commerce") {
                              setState(() {
                                projectType = value;
                                projectNumber = 3;
                              });
                            }
                          },
                          dropdownList: [
                            "Portfolio",
                            "Commercial",
                            "E-commerce",
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        customContainerProject(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15.0.h,
                              ),
                              _image == null
                                  ? ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(20.0.r),
                                      child: Image(
                                        width: 160.w,
                                        height: 120.h,
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://user-images.githubusercontent.com/20684618/31289519-9ebdbe1a-aae6-11e7-8f82-bf794fdd9d1a.png"),
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(20.0.r),
                                      child: Image.file(
                                        _image,
                                        width: 160.w,
                                        height: 120.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                              SizedBox(
                                height: 15.0.h,
                              ),
                              GestureDetector(
                                onTap: getImages,
                                child: Text(
                                  'Add Logo',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: dark_red,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          context: context,
                          widthContainer: 220.w,
                          heightContainer: 200.h,
                          widthLine: 130.w,
                          heightLine: 3.h,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          hintText: "App Name",
                          validation: (value) {
                            if (value.isEmpty || value.length < 3) {
                              return "Please Enter App Name of letter greater than 3 ";
                            }
                          },
                          saved: (value) {
                            appName = value;
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        // customContainerId(
                        //   context: context,
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                        //     child: Row(
                        //       children: [
                        //         Text(
                        //           'ID:',
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 20.sp,
                        //           ),
                        //         ),
                        //         Spacer(),
                        //         Text(''),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 10.h,
                        ),
                        customRadioButton(
                          context: context,
                          title: "admob_ads",
                          value: "admob Ads",
                          groupValue: radioValue,
                          onChanged: (value) {
                            setState(() {
                              radioValue = value;
                            });
                          },
                        ),
                        customRadioButton(
                          context: context,
                          title: "facebook_ads",
                          value: "facebook ads",
                          groupValue: radioValue,
                          onChanged: (value) {
                            setState(() {
                              radioValue = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        // GestureDetector(
                        //   onTap: getImagesAds,
                        //   child: Text(
                        //     'Add Images ADS',
                        //     style: TextStyle(
                        //       color: dark_red,
                        //       fontSize: 20,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        // ),
                        customImage(
                          name: "Image ADS",
                          image: _imageAds,
                          onTap: getImagesAds,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        BlocConsumer<NewProjectCubit, NewProjectStates>(
                          listener: (context, states) {
                            if (states is NewProjectSuccessStates) {
                              if (states.newProjectModals.newProjectResponse
                                      .status == "200" ) {
                                if (projectType == 'Portfolio') {
                                  Navigator.of(context).pushNamed(
                                      PortfolioStartScreen.routeName);
                                } else if (projectType == 'Commercial') {
                                  Navigator.of(context).pushNamed(
                                      CommericialStartScreen.routeName);
                                } else if (projectType == "E-commerce") {
                                  Navigator.of(context)
                                      .pushNamed(ECommerceHomeScreen.routeName);
                                }
                              } else {
                                Toast.show(
                                  states.newProjectModals.newProjectResponse
                                      .newResult.message,
                                  context,
                                  duration: Toast.LENGTH_SHORT,
                                  gravity: Toast.BOTTOM,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                );
                              }
                            }
                          },
                          builder: (context, states) {
                            var cubit = NewProjectCubit.get(context);
                            if (states is! NewProjectLoadingStates) {
                              return customButtonTheme(
                                  context: context,
                                  title: "save",
                                  function: () {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      cubit.createProject(
                                        name: appName,
                                        type: projectNumber.toString(),
                                        image: _image,
                                        imageAds: _imageAds,
                                        ads: radioValue,
                                      );
                                    }
                                  });
                            } else {
                              return spinKit;
                            }
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
