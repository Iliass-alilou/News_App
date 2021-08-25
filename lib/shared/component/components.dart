
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_screen/Web_Screen.dart';


//one Item
Widget Item_Of_News(article,context) => InkWell(
  onTap: (){
    NavigateTo(context, Web_View_Screen(
      url: '${article['url']}',
    )
    );
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 150.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage(
                '${article['urlToImage']}'
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],

    ),

  ),
);


//Separation between Items
Widget separator_Items() => Padding(
  padding: const EdgeInsets.only(
    top: 10.0,
    bottom: 10.0,
    left: 20.0,
    right: 20.0
  ),
  child:   Container(

    height: 1.5,

    width: 120.0,

    decoration: BoxDecoration(

      color: Colors.black

    ),

  ),
);

//Build all Items in My list
Widget Item_Builder_Conditional(List list) => ConditionalBuilder(
  condition: list.length>0,
  builder: (context) =>ListView.separated(
    physics:BouncingScrollPhysics(),
    itemBuilder: (context,index) => Item_Of_News(list[index],context),
    separatorBuilder:(context,index) =>  separator_Items(),
    itemCount: list.length,
  ),
  fallback: (context) => Center(child: CircularProgressIndicator()),
) ;

//for Navigation form a screen to an other
void NavigateTo(context,Widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ),
);