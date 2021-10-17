import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/screens/profile_screen/profile_screen.dart';
import 'package:mengo/screens/project_screen/cubit/project_cubit.dart';
import 'package:mengo/screens/project_screen/cubit/project_states.dart';
import 'package:mengo/screens/project_screen/newProject_screen.dart';
import 'package:mengo/widgets/custom_container_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/widgets/custom_stack.dart';
import 'package:mengo/widgets/cutom_container_project.dart';

class ProjectScreen extends StatelessWidget {
  static const String routeName = "project_screen";

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
                Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 200.w,
                  height: 100.w,
                ),
                SizedBox(
                  height: 60.h,
                ),
                Container(
                  child: customStack(
                    onTap: () {
                      Navigator.of(context).pushNamed(ProfileScreen.routeName);
                    },
                    context: context,
                    image:
                        'https://images.pexels.com/photos/1987301/pexels-photo-1987301.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                    column: Column(
                      children: [
                        SizedBox(
                          height: 65.h,
                        ),
                        Text(
                          translator.translate('project'),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                            color: dark_red,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        BlocConsumer<ProjectCubit, ProjectStates>(
                          listener: (context, states) {},
                          builder: (context, states) {
                            var cubit = ProjectCubit.get(context);
                            if (states is! ProjectLoadingStates) {
                              if (cubit.project.response.result.isEmpty) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 60.h),
                                  child: Text(
                                    "You Don't  Have Any Project yet",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: dark_red,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                );
                              }else{
                                return GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    mainAxisExtent: 180,
                                    childAspectRatio: 3 / 2,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5,
                                  ),
                                  itemCount:
                                  cubit.project.response.result.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return customContainerProject(
                                      context: context,
                                      // title: cubit.project.response.result[index].name,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h),
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(20.r),
                                              child: Image.network(
                                                cubit
                                                    .project
                                                    .response
                                                    .result[index]
                                                    .icon ==
                                                    null
                                                    ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png'
                                                    : cubit.project.response
                                                    .result[index].icon,
                                                height: 70,
                                                width: 100,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            cubit.project.response.result[index]
                                                .name,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: dark_red),
                                          ),
                                        ],
                                      ),
                                      color: text_project,
                                      widthLine: 80.w,
                                      heightLine: 3.h,
                                      widthContainer: 130.w,
                                      heightContainer: 120.h,
                                    );
                                  },
                                );
                              }
                            }else {
                              print('this is loading ');
                              return Center(
                                child: spinKit,
                              );
                            }

                          },
                        ),
                      ],
                    ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(NewProjectScreen.routeName);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: dark_red,
      ),
    );
  }
}
