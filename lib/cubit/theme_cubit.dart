import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mengo/cubit/theme_states.dart';
import 'package:mengo/helper/cached_helper.dart';

class ThemeModeCubit extends Cubit<ThemeModesStates> {
  ThemeModeCubit() : super(ThemeModeInitialStates());

  static ThemeModeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  // CacheHelper.putBoolData(key: 'isDark', value: isDark);
  void changeDarkTheme() {
    isDark = !isDark;
    emit(ThemeModeChangeStates());
  }
}
