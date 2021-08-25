
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
        return Item_Builder_Conditional(science_NewsList,context);
      },
    );
  }
}
