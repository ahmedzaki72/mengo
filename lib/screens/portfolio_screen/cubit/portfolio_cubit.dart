import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/end_point.dart';
import 'package:mengo/helper/dio_helper.dart';
import 'package:mengo/screens/portfolio_screen/cubit/portfolio_states.dart';
import 'package:mengo/screens/portfolio_screen/modals/portfolio_modal.dart';

class PortfolioCubit extends Cubit<PortfolioStates> {
  PortfolioCubit() : super(PortfolioInitialStates());

  static PortfolioCubit get(context) => BlocProvider.of(context);
  PortfolioModal portfolioStart;
  PortfolioModal portfolioAbout;
  PortfolioModal portfolioExperience;
  PortfolioModal portfolioSkills;
  PortfolioModal portfolioProject;
  PortfolioModal portfolioFooter;

  void addingStartPortfolio({
    String appName,
    String navBarColor,
    String startTitle,
    String titleColor,
    String starSubtitle,
    String startSubtitleColor,
    String body,
    String startBodyColor,
    File image,
  }) async {
    var formData = FormData.fromMap({
      "app_name": appName,
      "navbar_color": navBarColor,
      "start_title": startTitle,
      "start_title_color": titleColor,
      "start_subtitle": starSubtitle,
      "start_subtitle_color": startSubtitleColor,
      "start_body": body,
      "start_body_color": startBodyColor,
      "start_image": await MultipartFile.fromFile(image.path),
    });
    emit(PortfolioLoadingStates());
    DioHelper.postDataWithToken(
      url: PORTFOLIO_START,
      data: formData,
      token: tokens,
    ).then((value) {
      portfolioStart = PortfolioModal.fromJson(value.data);
      emit(PortfolioSuccessStates(portfolioModal: portfolioStart));
    }).catchError((error) {
      print(error);
      emit(PortfolioErrorStates(error:error ));
    });
  }

  void addingAboutPortfolio({
    String aboutColor,
    String titleColor,
    String subtitle,
    String subtitleColors,
    String body,
    String bodyColors,
    String portfolioTextColor,
    String portfolioButtonColor,
    String portfolioUrl,
    File image,
  }) async {
    var formData = FormData.fromMap({
      "about_color": aboutColor,
      "title_color": titleColor,
      "subtitle": subtitle,
      "subtitle_color": subtitleColors,
      " body": body,
      "body_color": bodyColors,
      "portfolio_text_color": portfolioTextColor,
      "portfolio_button_color": portfolioButtonColor,
      "image": await MultipartFile.fromFile(image.path),
      "portfolio_url": portfolioUrl,
    });
    emit(PortfolioLoadingAboutStates());
    DioHelper.postDataWithToken(
      url: PORTFOLIO_ABOUT,
      data: formData,
      token: tokens,
    ).then((value) {
      portfolioAbout = PortfolioModal.fromJson(value.data);
      emit(PortfolioSuccessAboutStates(portfolioAboutModals: portfolioAbout));
    }).catchError((error) {
      print(error);
      emit(PortfolioErrorAboutStates(error: error.toString()));
    });
  }

  void addingExperiencePortfolio(
      {String experienceBackground,
      String experienceTitleColor,
      String titleColor,
      String textColor,
      String iconColor,
      String title1,
      String title2,
      String title3,
      String title4,
      String body1,
      String body2,
      String body3,
      String body4}) async {
    var formData = FormData.fromMap({
      "experience_background": experienceBackground,
      "experience_title_color": experienceTitleColor,
      "titles_color": titleColor,
      "text_color": textColor,
      "icons_color": iconColor,
      "title1": title1,
      "title2": title2,
      "title3": title3,
      "title4": title4,
      "body1": body1,
      "body2": body2,
      "body3": body3,
      "body4": body4,
    });
    emit(PortfolioLoadingExperienceStates());
    DioHelper.postDataWithToken(
      url: PORTFOLIO_EXPERIENCE,
      data: formData,
      token: tokens,
    ).then((value) {
      portfolioExperience = PortfolioModal.fromJson(value.data);
      emit(PortfolioSuccessExperienceStates(
          portfolioExperienceModals: portfolioExperience));
    }).catchError((error) {
      print(error);
      emit(PortfolioErrorExperienceStates(error: error.toString()));
    });
  }

  void addingSkillsPortfolio({
    String skillsTitleColor,
    String skillTitle,
    String iconColor,
    String textColor,
    String title1,
    String title2,
    String title3,
    String icon1,
    String icon2,
    String icon3,
  }) async {
    var formData = FormData.fromMap({
      "skills_title_color": skillsTitleColor,
      "skills_title": skillTitle,
      "icon_color": iconColor,
      "text_color": textColor,
      "title1": title1,
      "title2": title2,
      "title3": title3,
      "icon1": icon1,
      "icon2": icon2,
      "icon3": icon3,
    });
    emit(PortfolioLoadingSkillsStates());
    DioHelper.postDataWithToken(
      url: PORTFOLIO_SKILLS,
      data: formData,
      token: tokens,
    ).then((value) {
      portfolioSkills = PortfolioModal.fromJson(value.data);
      emit(
          PortfolioSuccessSkillsStates(portfolioSkillsModals: portfolioSkills));
    }).catchError((error) {
      print(error);
      emit(PortfolioErrorSkillsStates(error: error.toString()));
    });
  }

  void addingProjectPortfolio({
    String background,
    String titleColor,
    File image1,
    File image2,
    File image3,
    String url1,
    String url2,
    String url3,
    String projectTitle1,
    String projectTitle2,
    String projectTitle3,
    String projectBody1,
    String projectBody2,
    String projectBody3,
  }) async {
    var formData = FormData.fromMap({
      "background": background,
      "title_color": titleColor,
      "image1": await MultipartFile.fromFile(image1.path),
      "image2": await MultipartFile.fromFile(image2.path),
      "image3": await MultipartFile.fromFile(image3.path),
      "url1": url1,
      "url2": url2,
      "url3": url3,
      "projectTitle1": projectTitle1,
      "projectTitle2": projectTitle2,
      "projectTitle3": projectTitle3,
      "projecBody1": projectBody1,
      "projecBody2": projectBody2,
      "projecBody3": projectBody3,
    });
    emit(PortfolioLoadingProjectStates());
    DioHelper.postDataWithToken(
      url: PORTFOLIO_PROJECT,
      data: formData,
      token: tokens,
    ).then((value) {
      portfolioProject = PortfolioModal.fromJson(value.data);
      emit(PortfolioSuccessProjectStates(
          portfolioProjectModals: portfolioProject));
    }).catchError((error) {
      print(error);
      emit(PortfolioErrorProjectStates(error: error.toString()));
    });
  }


  void addingFooterPortfolio({
    String footerBody,
    String footerBodyColor,
    String nameColor,
    String addressColor,
    String emailColor,
    String name,
    String address,
    String email,
  }) async {
    var formData = FormData.fromMap({
      "footerBody": footerBody,
      "footerBodyColor": footerBodyColor,
      "name_color": nameColor,
      "address_color": addressColor,
      "email_color": emailColor,
      "name": name,
      "address": address,
      "email": email,
    });
    emit(PortfolioLoadingFooterStates());
    DioHelper.postDataWithToken(
      url: PORTFOLIO_FOOTER,
      data: formData,
      token: tokens,
    ).then((value) {
      portfolioFooter = PortfolioModal.fromJson(value.data);
      emit(PortfolioSuccessFooterStates(
          portfolioFooter : portfolioFooter));
    }).catchError((error) {
      print(error);
      emit(PortfolioErrorFooterStates(error: error.toString()));
    });
  }
}
