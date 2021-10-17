import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/end_point.dart';
import 'package:mengo/helper/cached_helper.dart';
import 'package:mengo/helper/dio_helper.dart';
import 'package:mengo/screens/profile_screen/cubit/profile_states.dart';
import 'package:mengo/screens/profile_screen/profile_modals/profile_modals.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialStates());

  static ProfileCubit get(context) => BlocProvider.of(context);
  ProfileModals profile;
  File image;
  final picker = ImagePicker();
  ProfileChangeModals profileChange;

  Future getImages({
    BuildContext context,
  }) async {
    final pickerFile = await picker.getImage(source: ImageSource.gallery);

    if (pickerFile != null) {
      image = File(pickerFile.path);
      changePhoto();
    } else {
      Toast.show(
        'no_images_select',
        context,
        duration: Toast.LENGTH_SHORT,
        gravity: Toast.BOTTOM,
      );
    }
    emit(UploadImageStates());
  }

  getProfile()  {
    emit(ProfileLoadingStates());
    DioHelper.getAllData(
      url: GET_PROFILE,
      token: tokens,
    ).then((value) {
      profile = ProfileModals.fromJson(value.data);
      emit(ProfileSuccessStates(profileModals: profile));
    }).catchError((error) {
      emit(ProfileErrorStates(
        error: error.toString(),
      ));
    });
  }

  void changePhoto() async {
    var formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        image.path,
      ),
    });
    emit(ProfileAddLoadingStates());
    DioHelper.postDataWithToken(
      url: CHANGE_PROFILE_IMAGE,
      data: formData,
      token: tokens,
    ).then((value) {
      emit(ProfileAddSuccessStates());
    }).catchError((error) {
      print('error ${error.toString()}');
      emit(
        ProfileAddErrorStates(
          error: error.toString(),
        ),
      );
    });
  }

  void changeProfileData({
    String name,
    String email,
    String company,
  }) {
    var data = {
      "name": "editProfile",
      "param": {
        "name": name,
        "email": email,
        "company": company,
      },
    };
    emit(ProfileChangeLoadingStates());
    DioHelper.postDataWithToken(
      url: '',
      data: data,
      token: tokens,
    ).then((value) {
      print(value.data);
      profileChange = ProfileChangeModals.fromJson(value.data);
      emit(ProfileChangeSuccessStates(profileChange: profileChange));
    }).catchError((error) {
      print('this is error $error');
      emit(
        ProfileChangeErrorStates(
          error: error.toString(),
        ),
      );
    });
  }
}
