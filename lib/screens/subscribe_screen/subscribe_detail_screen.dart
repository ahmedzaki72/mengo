import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/helper/cached_helper.dart';
import 'package:mengo/screens/subscribe_screen/cubit/package_cubit.dart';
import 'package:mengo/screens/subscribe_screen/cubit/package_states.dart';
import 'package:mengo/screens/subscribe_screen/modals/package_modals.dart';
import 'package:mengo/widgets/custom_clip_path.dart';
import 'package:mengo/widgets/custom_container_background.dart';
import 'package:mengo/widgets/custom_cotainer_shadow.dart';
import 'package:mengo/widgets/custom_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/widgets/custom_row_subscribe.dart';
import 'package:toast/toast.dart';

class SubscribeDetailScreen extends StatelessWidget {
  static const String routeName = "Subscribe_detail_screen";

  @override
  Widget build(BuildContext context) {
    final PackageResult data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: customContainerBackground(
        image: "assets/images/bg.jpeg",
        context: context,
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'Subscriptions',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: dark_red,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    BlocConsumer<PackageCubit, PackageStates>(
                      listener: (context, states) {
                        if(states is PackageAddingSuccessStates) {
                           if(states.packageAddModals.responseAddPackage.status == 200) {
                             Toast.show(
                               states.packageAddModals.responseAddPackage.resultAddPackage.message ,
                               context,
                               backgroundColor: Colors.green,
                               textColor: Colors.white,
                               duration: Toast.LENGTH_SHORT,
                               gravity: Toast.BOTTOM,
                             );
                           }
                        }
                      },
                      builder: (context, states) {
                        var cubit = PackageCubit.get(context);
                        return GestureDetector(
                          onTap: () {
                            if (data.id == "1") {
                              cubit.choosePackage(packageId: "1");
                              CacheHelper.putStringData(key: 'id', value: "1");
                            } else if (data.id == "2") {
                              cubit.choosePackage(packageId: "2");
                              CacheHelper.putStringData(key: 'id', value: "1");
                            } else if (data.id == "3") {
                              cubit.choosePackage(packageId: "3");
                              CacheHelper.putStringData(key: 'id', value: "1");
                            } else if (data.id == "4") {
                              cubit.choosePackage(packageId: "4");
                              CacheHelper.putStringData(key: 'id', value: "1");
                            }
                          },
                          child: customContainerShadow(
                            context: context,
                            width: 250.w,
                            height: 350.h,
                            child: Column(
                              children: [
                                customClipPath(
                                  context: context,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      Text(
                                        data.english_name,
                                        style: TextStyle(
                                            fontSize: 30.sp,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Text(
                                        'EGP ${data.price} per month',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                customRowSubScribe(
                                    context: context, title: 'Create 50 apps'),
                                SizedBox(
                                  height: 10.h,
                                ),
                                customRowSubScribe(
                                    context: context,
                                    title: '2 GB Cloud Storge'),
                                SizedBox(
                                  height: 10.h,
                                ),
                                customRowSubScribe(
                                    context: context, title: 'With Mengo Ads'),
                                SizedBox(
                                  height: 10.h,
                                ),
                                customRowSubScribe(
                                    context: context,
                                    title: '5 Builds Apk Per App'),
                                SizedBox(
                                  height: 10.h,
                                ),
                                customRowSubScribe(
                                    context: context,
                                    title: '15 Pages Per App'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
