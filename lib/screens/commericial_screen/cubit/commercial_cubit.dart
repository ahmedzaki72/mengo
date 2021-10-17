import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/end_point.dart';
import 'package:mengo/helper/dio_helper.dart';
import 'package:mengo/screens/commericial_screen/cubit/commercial_states.dart';
import 'package:mengo/screens/commericial_screen/modals/commercial_modals.dart';

class CommercialCubit extends Cubit<CommercialStates> {
  CommercialCubit() : super(CommercialStartInitialStates());

  static CommercialCubit get(context) => BlocProvider.of(context);
  CommercialModal commercialStart;
  CommercialModal commercialAbout;
  CommercialModal commercialService;
  CommercialModal commercialProject;
  CommercialModal commercialLatest;
  CommercialModal commercialFooter;
  CommercialModal commercialSingleProject;
  CommercialModal commercialSingleService;

  void addingCommercialStart({
    String navBarColor,
    String siteName,
    File image1,
    File image2,
  }) async {
    var formData = FormData.fromMap({
      "navbar_color": navBarColor,
      "site_name": siteName,
      "image1": await MultipartFile.fromFile(image1.path),
      "image2": await MultipartFile.fromFile(image2.path),
    });
    emit(CommercialStartLoadingStates());
    DioHelper.postDataWithToken(
      url: COMMERCIAL_START,
      data: formData,
      token: tokens,
    ).then((value) {
      commercialStart = CommercialModal.fromJson(value.data);
      emit(CommercialStartSuccessStates(commercialModal: commercialStart));
    }).catchError((error) {
      emit(CommercialStartErrorStates(
        error: error.toString(),
      ));
    });
  }

  void addingCommercialAbout({
    String backgroundColor,
    String titleColor,
    String textColor,
    String text,
    File image,
  }) async {
    var formData = FormData.fromMap({
      "background_color": backgroundColor,
      "title_color": titleColor,
      "text_color": textColor,
      "text": text,
      "image": await MultipartFile.fromFile(image.path),
    });
    emit(CommercialLoadingAboutStates());
    DioHelper.postDataWithToken(
      url: COMMERCIAL_ABOUT,
      data: formData,
      token: tokens,
    ).then((value) {
      commercialAbout = CommercialModal.fromJson(value.data);
      emit(
          CommercialSuccessAboutStates(commercialAboutModals: commercialAbout));
    }).catchError((error) {
      print(error);
      emit(CommercialErrorAboutStates(error: error.toString()));
    });
  }

  void addingCommercialService({
    String titleColor,
    String textColor,
    String text,
    String moreButtonColor,
    String moreButtonTextColor,
  }) async {
    var formData = FormData.fromMap({
      "title_color": titleColor,
      "text_color": textColor,
      "text": text,
      "more_button_color": moreButtonColor,
      "more_button_text_color": moreButtonTextColor,
    });
    emit(CommercialServicesLoadingStates());
    DioHelper.postDataWithToken(
      url: COMMERCIAL_SERVICES,
      data: formData,
      token: tokens,
    ).then((value) {
      commercialService = CommercialModal.fromJson(value.data);
      emit(CommercialServicesSuccessStates(
          commercialServices: commercialService));
    }).catchError((error) {
      print(error);
      emit(CommercialStartErrorStates(error: error.toString()));
    });
  }

  void addingCommercialProject({
    String backgroundColor,
    String titleColor,
    String textColor,
    String text,
    String moreButtonColor,
    String moreButtonTextColor,
  }) async {
    var formData = FormData.fromMap({
      "background_color": backgroundColor,
      "title_color": titleColor,
      "text_color": textColor,
      "text": text,
      "more_button_color": moreButtonColor,
      "more_button_text_color": moreButtonTextColor,
    });
    emit(CommercialLoadingProjectStates());
    DioHelper.postDataWithToken(
      url: COMMERCIAL_PROJECT,
      data: formData,
      token: tokens,
    ).then((value) {
      commercialProject = CommercialModal.fromJson(value.data);
      emit(
          CommercialSuccessProjectStates(commercialProject: commercialProject));
    }).catchError((error) {
      print(error);
      emit(CommercialErrorProjectStates(error: error));
    });
  }

  void addingCommercialLatest(
      {String titleColor,
      String textColor,
      String text1,
      String text2,
      File image1,
      File image2}) async {
    var formData = FormData.fromMap({
      "title_color": titleColor,
      "text_color": textColor,
      "text1": text1,
      "text2": text2,
      "image1": await MultipartFile.fromFile(image1.path),
      "image2": await MultipartFile.fromFile(image2.path),
    });
    emit(CommercialLatestLoadingStates());
    DioHelper.postDataWithToken(
      url: COMMERCIAL_LATEST,
      data: formData,
      token: tokens,
    ).then((value) {
      commercialLatest = CommercialModal.fromJson(value.data);
      emit(CommercialLatestSuccessStates(commercialLatest: commercialLatest));
    }).catchError((error) {
      print(error);
      emit(CommercialLatestErrorStates(error: error));
    });
  }

  void addingCommercialFooter({
    String mapLink,
    String backgroundColor,
    String title,
    String titleColor,
    String text,
    String textColor,
    String aboutColor,
    String addressColor,
    String emailColor,
    String address,
    String email,
  }) async {
    var formData = FormData.fromMap({
      "map_link": mapLink,
      "background_color": backgroundColor,
      "title": title,
      "title_color": titleColor,
      "text": text,
      "text_color": textColor,
      "about_color": aboutColor,
      "address_color": addressColor,
      "email_color": emailColor,
      "address": address,
      "email": email,
    });
    emit(CommercialFooterLoadingStates());
    DioHelper.postDataWithToken(
      url: COMMERCIAL_FOOTER,
      data: formData,
      token: tokens,
    ).then((value) {
      commercialFooter = CommercialModal.fromJson(value.data);
      emit(CommercialFooterSuccessStates(commercialFooter: commercialFooter));
    }).catchError((error) {
      print(error);
      emit(CommercialFooterErrorStates(error: error));
    });
  }

  void addingCommercialSingleProject({
    String name,
    String text,
    String link,
    File image,
  }) async {
    var formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(image.path),
      "name": name,
      "text": text,
      "link": link,
    });
    emit(CommercialSingleProjectLoadingStates());
    DioHelper.postDataWithToken(
      url: COMMERCIAL_SINGLE_PROJECT,
      data: formData,
      token: tokens,
    ).then((value) {
      commercialSingleProject = CommercialModal.fromJson(value.data);
      emit(CommercialSingleProjectSuccessStates(
          commercialSingleProject: commercialProject));
    }).catchError((error) {
      print(error);
      emit(CommercialSingleProjectErrorStates(error: error));
    });
  }

  void addingCommercialSingleService({
    String title,
    String text,
    String titleColor,
    String textColor,
    File image,
  }) async {
    var formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(image.path),
      "title": title,
      "text": text,
      "title_color": titleColor,
      "text_color": textColor,
    });
    emit(CommercialSingleServiceLoadingStates());
    DioHelper.postDataWithToken(
      url: COMMERCIAL_SINGLE_SERVICE,
      data: formData,
      token: tokens,
    ).then((value) {
      commercialSingleService = CommercialModal.fromJson(value.data);
      emit(CommercialSingleServiceSuccessStates(
          commercialSingleService: commercialSingleService));
    }).catchError((error) {
      print(error);
      emit(CommercialSingleServiceErrorStates(error: error));
    });
  }
}
