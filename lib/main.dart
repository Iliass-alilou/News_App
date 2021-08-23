import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/observer.dart';

import 'layout/News_App.dart';


void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.orange,
          elevation:5.0,
        ),
      ),
      darkTheme: ThemeData(
        //scaffoldBackgroundColor: Colors.black12,
      ),
      themeMode: ThemeMode.light,
      home: NewsApp(),
    );
  }
}