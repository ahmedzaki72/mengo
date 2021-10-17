import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/end_point.dart';
import 'package:mengo/helper/dio_helper.dart';
import 'package:mengo/screens/subscribe_screen/cubit/package_states.dart';
import 'package:mengo/screens/subscribe_screen/modals/package_add_modals.dart';
import 'package:mengo/screens/subscribe_screen/modals/package_modals.dart';

class PackageCubit extends Cubit<PackageStates> {
  PackageCubit() : super(PackageInitialStates());

  static PackageCubit get(context) => BlocProvider.of(context);
  PackageModals package;
  PackageAddModals packageIdModals;

  void getAllPackage() {
    emit(PackageLoadingStates());
    DioHelper.getAllData(
      url: GET_ALL_PROJECT,
      token: tokens,
    ).then((value) {
      package = PackageModals.fromJson(value.data);
      emit(PackageSuccessStates());
    }).catchError((error) {
      print('this is error $error');
      emit(PackageErrorStates(error: error.toString()));
    });
  }

  void choosePackage({String packageId}) {
    emit(PackageAddingLoadingStates());
    DioHelper.postDataWithToken(
      url: '',
      data: {
        "name": "setPackage",
        "param": {
          "package_id": packageId,
        }
      },
      token: tokens,
    ).then((value) {
      packageIdModals = PackageAddModals.fromJson(value.data);
      emit(PackageAddingSuccessStates(packageAddModals: packageIdModals));
    }).catchError((error) {
      print('this is $error');
      emit(
        PackageAddingErrorStates(error: error),
      );
    });
  }
}
