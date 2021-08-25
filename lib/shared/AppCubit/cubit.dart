
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/AppCubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class App_Cubit extends Cubit<App_States> {

  App_Cubit(): super(App_Initial_State());

  static App_Cubit get(context) => BlocProvider.of(context);


  bool isDark = false;

  void ChangeMood ({ bool? fromShared})
  {
    if(fromShared != null){
      isDark = fromShared;
      emit(App_Dark_Light_Mood_State());

    }
    else{
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value)
      {
        emit(App_Dark_Light_Mood_State());

      });
    }

  }

}