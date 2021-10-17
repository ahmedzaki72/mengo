import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/end_point.dart';
import 'package:mengo/helper/dio_helper.dart';
import 'package:mengo/screens/project_screen/%20modals/project_modals.dart';
import 'package:mengo/screens/project_screen/cubit/project_states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectCubit extends Cubit<ProjectStates> {
  ProjectCubit() : super(ProjectInitialStates());

  static ProjectCubit get(context) => BlocProvider.of(context);
  ProjectModals project;

  void getAllProject() {
    emit(ProjectLoadingStates());
    DioHelper.getAllData(
      url: USER_PROJECT_DATA,
      token: tokens,
    ).then((value) {
      project = ProjectModals.fromJson(value.data);
      emit(ProjectSuccessStates(projectModals: project));
    }).catchError((error) {
      print("this is error ${error.toString()}");
      emit(ProjectErrorStates(error: error));
    });
  }
}
