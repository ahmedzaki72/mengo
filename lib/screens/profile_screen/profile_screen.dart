import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/helper/cached_helper.dart';
import 'package:mengo/screens/about_screen/about_screen.dart';
import 'package:mengo/screens/login_screen/login_screen.dart';
import 'package:mengo/screens/package_screen/package_screen.dart';
import 'package:mengo/screens/profile_screen/cubit/profile_cubit.dart';
import 'package:mengo/screens/profile_screen/cubit/profile_states.dart';
import 'package:mengo/screens/subscribe_screen/subscribe_screen.dart';
import 'package:mengo/widgets/check_direction.dart';
import 'package:mengo/widgets/custom_avatar.dart';
import 'package:mengo/widgets/custom_button_back.dart';
import 'package:mengo/widgets/custom_button_languages.dart';
import 'package:mengo/widgets/custom_button_profile.dart';
import 'package:mengo/widgets/custom_container_background.dart';
import 'package:mengo/widgets/custom_cotainer_shadow.dart';
import 'package:mengo/widgets/cutom_text_form.dart';
import 'package:toast/toast.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = "profile_Screen";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name, email, company;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: customContainerBackground(
          context: context,
          image: 'assets/images/bg.jpeg',
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment:
                      checkDirection(Alignment.topRight, Alignment.topLeft),
                  child: Padding(
                    padding: checkDirection(
                        EdgeInsets.only(top: 8.h, right: 8.w),
                        EdgeInsets.only(top: 8.h, left: 8.w)),
                    child: customButtonBack(context: context),
                  ),
                ),
                Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 200.w,
                  height: 100.w,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  translator.translate('profile'),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                customContainerShadow(
                  context: context,
                  width: 300.w,
                  height: 520.h,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 45.h,
                      ),
                      BlocConsumer<ProfileCubit, ProfileStates>(
                        listener: (context, states) {
                          if(states is ProfileSuccessStates) {
                            if(states.profileModals == null ) {
                              Toast.show(
                                'data not loading',
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
                          var cubit = ProfileCubit.get(context);
                           print(cubit.profile.profileResponse.status);
                          if (states is! ProfileLoadingStates) {
                            return customAvatar(
                              context: context,
                              image: cubit.image,
                              onTap: () => cubit.getImages(context: context),
                              images: cubit.profile.profileResponse
                                          .profileResult.profile_image ==
                                      null
                                  ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png'
                                  : cubit.profile.profileResponse.profileResult
                                      .profile_image,
                            );
                          } else {
                            print('spinkit is loading');
                            return spinKit;
                          }
                        },
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomTextFormField(
                        hintText: translator.translate('name'),
                        onChanged: (value) {
                          name = value;
                        },
                      ),
                      CustomTextFormField(
                        hintText: translator.translate('company_name'),
                        onChanged: (value) {
                          company = value;
                        },
                      ),
                      CustomTextFormField(
                        hintText: translator.translate('email'),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      BlocConsumer<ProfileCubit, ProfileStates>(
                        listener: (context, states) {
                          if (states is ProfileChangeSuccessStates) {
                            if (states.profileChange.responseChange.status ==
                                200) {
                              Toast.show(
                                states.profileChange.responseChange.resultChange
                                    .message,
                                context,
                                duration: Toast.LENGTH_SHORT,
                                gravity: Toast.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                              );
                            }
                          }
                        },
                        builder: (context, states) {
                          var cubit = ProfileCubit.get(context);
                          if (states is! ProfileChangeLoadingStates) {
                            return customButtonProfile(
                                context: context,
                                title: translator.translate('save'),
                                function: () {
                                  cubit.changeProfileData(
                                      name: name,
                                      email: email,
                                      company: company);
                                });
                          } else {
                            return spinKit;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      customButtonProfile(
                          context: context,
                          title: translator.translate('subscribe'),
                          function: () {
                            Navigator.of(context)
                                .pushNamed(SubscribeScreen.routeName);
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      customButtonProfile(
                          context: context,
                          title: translator.translate('about_us'),
                          function: () {
                            Navigator.of(context)
                                .pushNamed(AboutScreen.routeName);
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      customButtonProfile(
                          context: context,
                          title: translator.translate('logOut'),
                          function: () {
                            CacheHelper.clearData(key: 'token').then((value) {
                              Navigator.of(context)
                                  .pushReplacementNamed(LoginScreen.routeName);
                            });
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      customButtonLanguages(context: context),
                      SizedBox(
                        height: 10,
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
    );
  }
}
