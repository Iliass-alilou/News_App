
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsApp_Cubit,NewsApp_States>(
      listener:(context ,state){},
      builder:(context ,state){
        var business_NewsList = NewsApp_Cubit.get(context).business;
        return ConditionalBuilder(
          condition: business_NewsList.length>0,
          builder: (context) =>ListView.separated(
              physics:BouncingScrollPhysics(),
              itemBuilder: (context,index) => Item_Of_News(business_NewsList[index],context),
              separatorBuilder:(context,index) =>  separator_Items(),
              itemCount: business_NewsList.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        ) ;
      },
    );
  }
}
