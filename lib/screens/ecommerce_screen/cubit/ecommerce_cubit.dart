import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/end_point.dart';
import 'package:mengo/helper/dio_helper.dart';
import 'package:mengo/screens/ecommerce_screen/cubit/ecommerce_states.dart';
import 'package:mengo/screens/ecommerce_screen/modals/ecommerce_modals.dart';
import 'package:toast/toast.dart';

class ECommerceCubit extends Cubit<ECommerceStates> {
  ECommerceCubit() : super(ECommerceHomeInitialStates());

  static ECommerceCubit get(context) => BlocProvider.of(context);
  ECommerceModal eCommerceHome;
  ECommerceModal eCommerceOfferProduct;
  ECommerceModal eCommerceSalesProduct;
  ECommerceModal eCommerceCategoryOne;
  ECommerceModal eCommerceCategoryTwo;
  ECommerceModal eCommerceCategoryThree;

  void addingHomeECommerce({
    String siteName,
    String navBarColor,
    String categoryOne,
    String categoryTwo,
    String categoryThree,
    File categoryOneImage,
    File categoryTwoImage,
    File categoryThreeImage,
    File offerImage,
    File salesImage,
    File homeImage1,
    File homeImage2,
    String aboutTitleColor,
    File aboutImage,
    String siteDescription,
    String catigoriesTitleColor,
    String footerTitleColors,
    String footerText,
    String footerAddressColor,
    String footerEmailColor,
    String footerAddress,
    String footerEmail,
  }) async {
    var formData = FormData.fromMap({
      "site_name": siteName,
      "navbar_color": navBarColor,
      "category_one": categoryOne,
      "category_two": categoryTwo,
      "category_three": categoryThree,
      "category_one_image": await MultipartFile.fromFile(categoryOneImage.path),
      "category_two_image": await MultipartFile.fromFile(categoryTwoImage.path),
      "category_three_image":
          await MultipartFile.fromFile(categoryThreeImage.path),
      "offers_image": await MultipartFile.fromFile(offerImage.path),
      "sales_image": await MultipartFile.fromFile(salesImage.path),
      "home_image1": await MultipartFile.fromFile(homeImage1.path),
      "home_image2": await MultipartFile.fromFile(homeImage2.path),
      "about_title_color": aboutTitleColor,
      "about_image": await MultipartFile.fromFile(aboutImage.path),
      "site_description": siteDescription,
      "catigories_title_color": catigoriesTitleColor,
      "footer_titles_color": footerTitleColors,
      "footer_text": footerText,
      "footer_address_color": footerAddressColor,
      "footer_email_color": footerEmailColor,
      "footer_address": footerAddress,
      "footer_email": footerEmail,
    });
    emit(ECommerceHomeLoadingStates());
    DioHelper.postDataWithToken(
      url: ECOMMERCE_HOME,
      data: formData,
      token: tokens,
    ).then((value) {
      eCommerceHome = ECommerceModal.fromJson(value.data);
      emit(ECommerceHomeSuccessStates(eCommerceHome: eCommerceHome));
    }).catchError((error) {
      print(error);
      emit(ECommerceHomeErrorStates(
        error: error.toString(),
      ));
    });
  }

  void addingECommerceOfferProduct({
    String name,
    String price,
    File image,
  }) async {
    var formData = FormData.fromMap({
      "name": name,
      "price": price,
      "image": await MultipartFile.fromFile(image.path),
    });
    emit(ECommerceOfferProductLoadingStates());
    DioHelper.postDataWithToken(
      url: ECOMMERCE_OFFER_PRODUCT,
      data: formData,
      token: tokens,
    ).then((value) {
      eCommerceOfferProduct = ECommerceModal.fromJson(value.data);
      emit(ECommerceOfferProductSuccessStates(
          eCommerceOfferProduct: eCommerceOfferProduct));
    }).catchError((error) {
      print(error);
      emit(ECommerceOfferProductErrorStates(error: error.toString()));
    });
  }

  void addingECommerceSalesProduct({
    String name,
    String price,
    File image,
  }) async {
    var formData = FormData.fromMap({
      "name": name,
      "price": price,
      "image": await MultipartFile.fromFile(image.path),
    });
    emit(ECommerceSalesProductLoadingStates());
    DioHelper.postDataWithToken(
      url: ECOMMERCE_SALES_PRODUCT,
      data: formData,
      token: tokens,
    ).then((value) {
      eCommerceSalesProduct = ECommerceModal.fromJson(value.data);
      emit(ECommerceSalesProductSuccessStates(
          eCommerceSalesProduct: eCommerceSalesProduct));
    }).catchError((error) {
      print(error);
      emit(ECommerceSalesProductErrorStates(error: error.toString()));
    });
  }

  void addingECommerceCategoryOne({
    String name,
    String price,
    File image,
  }) async {
    var formData = FormData.fromMap({
      "name": name,
      "price": price,
      "image": await MultipartFile.fromFile(image.path),
    });
    emit(ECommerceCategoryOneLoadingStates());
    DioHelper.postDataWithToken(
      url: ECOMMERCE_CATEGORY_ONE,
      data: formData,
      token: tokens,
    ).then((value) {
      eCommerceCategoryOne = ECommerceModal.fromJson(value.data);
      emit(ECommerceCategoryOneSuccessStates(
          eCommerceCategoryOne: eCommerceCategoryOne));
    }).catchError((error) {
      print(error);
      emit(ECommerceCategoryOneErrorStates(error: error));
    });
  }

  void addingECommerceCategoryTwo({
    String name,
    String price,
    File image,
  }) async {
    var formData = FormData.fromMap({
      "name": name,
      "price": price,
      "image": await MultipartFile.fromFile(image.path),
    });
    emit(ECommerceCategoryTwoLoadingStates());
    DioHelper.postDataWithToken(
      url: ECOMMERCE_CATEGORY_TWO,
      data: formData,
      token: tokens,
    ).then((value) {
      eCommerceCategoryTwo = ECommerceModal.fromJson(value.data);
      emit(ECommerceCategoryTwoSuccessStates(
          eCommerceCategoryTwo: eCommerceCategoryTwo));
    }).catchError((error) {
      print(error);
      emit(ECommerceCategoryTwoErrorStates(error: error));
    });
  }

  void addingECommerceCategoryThree({
    String name,
    String price,
    File image,
  }) async {
    var formData = FormData.fromMap({
      "name": name,
      "price": price,
      "image": await MultipartFile.fromFile(image.path),
    });
    emit(ECommerceCategoryThreeLoadingStates());
    DioHelper.postDataWithToken(
      url: ECOMMERCE_CATEGORY_THREE,
      data: formData,
      token: tokens,
    ).then((value) {
      eCommerceCategoryThree = ECommerceModal.fromJson(value.data);
      emit(ECommerceCategoryThreeSuccessStates(
          eCommerceCategoryThree: eCommerceCategoryThree));
    }).catchError((error) {
      print(error);
      emit(ECommerceCategoryThreeErrorStates(error: error));
    });
  }
}
