import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/models/subscribe_models.dart';
import 'package:mengo/screens/subscribe_screen/cubit/package_cubit.dart';
import 'package:mengo/screens/subscribe_screen/cubit/package_states.dart';
import 'package:mengo/screens/subscribe_screen/subscribe_detail_screen.dart';
import 'package:mengo/widgets/custom_container_background.dart';
import 'package:mengo/widgets/custom_cotainer_shadow.dart';
import 'package:mengo/widgets/custom_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/widgets/cutom_container_project.dart';

class SubscribeScreen extends StatelessWidget {
  static const String routeName = "subscribe_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: customContainerBackground(
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
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            translator.translate('subscribe'),
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
                            listener: (context, states) {},
                            builder: (context, states) {
                              var cubit = PackageCubit.get(context);
                              if (states is! PackageLoadingStates) {
                                return GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      mainAxisExtent: 215,
                                      childAspectRatio: 3 / 2,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5,
                                    ),
                                    itemCount: cubit.package.packageResponse
                                        .packageResult.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                            SubscribeDetailScreen.routeName,
                                            arguments: cubit
                                                .package
                                                .packageResponse
                                                .packageResult[index],
                                          );
                                        },
                                        child: customContainerProject(
                                            widthLine: 80.w,
                                            heightLine: 2.h,
                                            title: cubit
                                                .package
                                                .packageResponse
                                                .packageResult[index]
                                                .english_name,
                                            widthContainer: 130.w,
                                            heightContainer: 120.h,
                                            context: context,
                                            color: dark_red,
                                            fontWeight: FontWeight.w600,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                // Image.asset(
                                                //   subscribeList[index].image,
                                                //   width: 120.w,
                                                //   height: 70.h,
                                                // ),
                                                Text(
                                                  cubit
                                                      .package
                                                      .packageResponse
                                                      .packageResult[index]
                                                      .english_name,
                                                  style: TextStyle(
                                                    fontSize: 15.0.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Text(
                                                  cubit
                                                      .package
                                                      .packageResponse
                                                      .packageResult[index]
                                                      .price,
                                                  style: TextStyle(
                                                    fontSize: 15.0.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            )),
                                      );
                                    });
                              } else {
                                return Center(
                                  child: spinKit,
                                );
                              }
                            },
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
