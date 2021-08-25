
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class Science extends StatelessWidget {
  const Science({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsApp_Cubit,NewsApp_States>(
      listener:(context ,state){},
      builder:(context ,state){
        var science_NewsList = NewsApp_Cubit.get(context).science;
        return ConditionalBuilder(
          condition: science_NewsList.length>0,
          builder: (context) =>ListView.separated(
            physics:BouncingScrollPhysics(),
            itemBuilder: (context,index) => Item_Of_News(science_NewsList[index], context),
            separatorBuilder:(context,index) =>  separator_Items(),
            //itemCount: NewsApp_Cubit.get(context).science.length,
            itemCount: science_NewsList.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        ) ;
      },
    );
  }
}
