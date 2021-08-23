
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
          condition: state is! getNews_Business_Loading_State,
          builder: (context) =>ListView.separated(
              physics:BouncingScrollPhysics(),
              itemBuilder: (context,index) => Item_Of_News(business_NewsList[index]),
              separatorBuilder:(context,index) =>  SizedBox(
                height: 10.0,
              ),
              itemCount: 10
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        ) ;
      },
    );
  }
}
