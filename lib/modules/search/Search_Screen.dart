import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class Search_Screen extends StatelessWidget {


  var search_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
      return BlocConsumer<NewsApp_Cubit,NewsApp_States>(
        listener: (context , state){},
        builder: (context , state){

          var search_list = NewsApp_Cubit.get(context).search_list;
          return  Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: search_Controller,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      border:OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Search should not be empty';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      NewsApp_Cubit.get(context).get_Resault_Search(value);
                    },
                  ),
                ),
                Expanded(
                  child:Item_Builder_Conditional(search_list),
                ),
              ],
            ),
          ) ;
        },
      );
  }
}
