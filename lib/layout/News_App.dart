
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> NewsApp_Cubit()..getBusiness(),
      child: BlocConsumer<NewsApp_Cubit,NewsApp_States>(
          listener: (context , state) {},
          builder: (context , state) {
            var cubit = NewsApp_Cubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                    'App News'
                ),
                actions: [
                  IconButton(
                      onPressed: (){},
                      icon:Icon(Icons.search)
                  ),
                ],
              ),
              body: cubit.screens[cubit.index_Of_Item_NavigationBar],
              bottomNavigationBar: BottomNavigationBar(
                type:BottomNavigationBarType.fixed,
                items:cubit.items_OfNavigationBar,
                currentIndex: cubit.index_Of_Item_NavigationBar,
                onTap: (index){
                  cubit.changeIndexSelectedItem(index);
                },
              ) ,
            );
          },
      ),
    );
  }
}
