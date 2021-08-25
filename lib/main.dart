import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/AppCubit/cubit.dart';
import 'package:news_app/shared/AppCubit/states.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/observer.dart';
import 'layout/News_App.dart';



void main() async {

  // aftter waiting for asyn methodes run my App

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp(
      isDark: isDark ,
  ));
}


class MyApp extends StatelessWidget {

  final  bool? isDark;

  MyApp({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsApp_Cubit()..getBusiness()..getSciences()..getSports(),),
        BlocProvider(create: (context) => App_Cubit()..ChangeMood(fromShared: isDark,),
    ),

      ],

      child: BlocConsumer<App_Cubit,App_States>(
        listener: (context , state){},
        builder: (context , state){
          return MaterialApp(

            debugShowCheckedModeBanner: false,


            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                backwardsCompatibility:false ,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarColor: Colors.black,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize:20.0,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                actionsIconTheme: IconThemeData(
                  color: Colors.black,
                ),
                iconTheme: IconThemeData(
                    color: Colors.black,
                ),

              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation:20.0,
                backgroundColor: Colors.white,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 18.0
                ),
              ),
            ),



            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                backwardsCompatibility:false ,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarColor: HexColor('333739'),
                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize:20.0,
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0.0,
                actionsIconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation:20.0,
                backgroundColor: HexColor('333739'),
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 18.0
                ),
              ),
            ),


            themeMode:App_Cubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light ,


            home: Directionality(
              textDirection: TextDirection.ltr,
              child: NewsApp(),
            ),
          ) ;
        },
      ),
    );
  }

}