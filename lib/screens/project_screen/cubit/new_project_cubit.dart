import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/end_point.dart';
import 'package:mengo/helper/dio_helper.dart';
import 'package:mengo/screens/project_screen/%20modals/newProject_modals.dart';
import 'package:mengo/screens/project_screen/cubit/new_project_states.dart';

class NewProjectCubit extends Cubit<NewProjectStates> {
  NewProjectCubit() : super(NewProjectInitialStates());
  static NewProjectCubit get(context) => BlocProvider.of(context);
  NewProjectModals newProjectModals;

  void createProject({
    String type,
    String name,
    File image,
    File imageAds,
    String ads,
  }) async {
    var formData = FormData.fromMap({
      "name": name,
      'type': type,
      'icon': await MultipartFile.fromFile(image.path),
      'ad_image' : await MultipartFile.fromFile(imageAds.path),
      'ad' : ads,
    });
    emit(NewProjectLoadingStates());
    DioHelper.postDataWithToken(
      url: CREATE_PROJECT,
      data: formData,
      token: tokens,
    ).then((value) {
      print(value.data);
      newProjectModals = NewProjectModals.fromJson(value.data);
      emit(NewProjectSuccessStates(newProjectModals: newProjectModals));
    }).catchError((error) {
      print('this is error $error');
      emit(NewProjectErrorStates(error: error.toString()));
    });
  }
}
