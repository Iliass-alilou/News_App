
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class Sport extends StatelessWidget {
  const Sport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsApp_Cubit,NewsApp_States>(
      listener:(context ,state){},
      builder:(context ,state){
        var sport_NewsList = NewsApp_Cubit.get(context).sports;
        return ConditionalBuilder(
          //condition: state is! getNews_Sports_Loading_State,
          condition:sport_NewsList.length>0 ,
          builder: (context) =>ListView.separated(
            physics:BouncingScrollPhysics(),
            itemBuilder: (context,index) => Item_Of_News(sport_NewsList[index],context),
            separatorBuilder:(context,index) =>  separator_Items(),
            //itemCount: NewsApp_Cubit.get(context).sports.length,
            itemCount: sport_NewsList.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        ) ;
      },
    );
  }
}
