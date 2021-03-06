
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business.dart';
import 'package:news_app/modules/parameters/parameters.dart';
import 'package:news_app/modules/science/science.dart';
import 'package:news_app/modules/sports/sport.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsApp_Cubit extends Cubit<NewsApp_States>{

  NewsApp_Cubit(): super(NewsApp_InitialState());

  static NewsApp_Cubit get(context) => BlocProvider.of(context);

  int index_Of_Item_NavigationBar = 0;

  List <BottomNavigationBarItem> items_OfNavigationBar =[
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
      label: 'Business'
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'Science'
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'Sports'
    ),
  ];

  List<Widget> screens = [
    Business(),
    Science(),
    Sport(),
  ];
  changeIndexSelectedItem (int index){
    index_Of_Item_NavigationBar = index;
    if(index_Of_Item_NavigationBar == 1 ){
      getSciences();
    }
    if(index_Of_Item_NavigationBar == 2 ){
      getSports();
    }
    emit(IndexItemSelected_State());
  }

  List <dynamic> business = [];

  void getBusiness (){
    emit(getNews_Business_Loading_State());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '0c6503df72914d4693c4514b6b825d12',
      },
    ).then((value){
      business = value.data['articles'];
      print(business[0]['title']);
      emit(getNews_Business_Success_State());
    }).catchError((error){
      print(error.toString());

      emit(getNews_Business_Error_State(error: error.toString()));
    });
  }


  List <dynamic> sports = [];

  void getSports (){
    if (sports.length == 0){
      emit(getNews_Sports_Loading_State());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sport',
          'apiKey': '0c6503df72914d4693c4514b6b825d12',
        },
      ).then((value){
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(getNews_Sports_Success_State());
      }).catchError((error){
        print(error.toString());

        emit(getNews_Sports_Error_State(error: error.toString()));
      });
    }
    else{
      emit(getNews_Sports_Success_State());
    }
  }


  List <dynamic> science = [];

  void getSciences (){
    if(science.length == 0){
      emit(getNews_Science_Loading_State());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': '0c6503df72914d4693c4514b6b825d12',
        },
      ).then((value){
        science = value.data['articles'];
        print(science[0]['title']);
        emit(getNews_Science_Success_State());
      }).catchError((error){
        print(error.toString());

        emit(getNews_Science_Error_State(error: error.toString()));
      });
    }
    else{
      emit(getNews_Science_Success_State());
    }
  }


  List <dynamic> search_list = [];

  void get_Resault_Search(String value){

    emit(getNews_Search_Loading_State());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '0c6503df72914d4693c4514b6b825d12',
      },
    ).then((value){
      search_list = value.data['articles'];
      print(search_list[0]['title']);
      emit(getNews_Search_Success_State());
    }).catchError((error){
      print(error.toString());

      emit(getNews_Search_Error_State(error: error.toString()));
    });

  }


}