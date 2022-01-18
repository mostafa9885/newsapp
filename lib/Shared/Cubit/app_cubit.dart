

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Network/Local/cache_helper.dart';
import 'package:newsapp/Shared/Cubit/app_states.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void ChangeMode({bool? fromShared})
  {
    if(fromShared != null)
    {
      isDark = fromShared;
      emit(AppChangeModeState());
    }
    else
    {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark)
          .then((value) {emit(AppChangeModeState());});
      emit(AppChangeModeState());
    }

  }



}