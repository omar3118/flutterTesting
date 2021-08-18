
import 'package:app01/layout/news_app/cubit/news_app_cubit.dart';
import 'package:app01/layout/news_app/cubit/news_app_states.dart';
import 'package:app01/shared/components/components.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

        return BlocConsumer<NewsAppCubit,NewsAppStates>(
          listener: (context,state){},
          builder:(context,state){
            print('inSearching');
          var list= NewsAppCubit.get(context).search;
            return Scaffold(
          appBar: AppBar(centerTitle: true,title: Text('Searching'),),
          body: Column(
            children: [

              defaultTFF(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                controller: searchController,
                labelText: 'Search',
                keyboardType: TextInputType.text,
                suffixIcon: Icons.search,
                onChanged: (value){
                   NewsAppCubit.get(context).getSearch(value.toString());
                },
               radius: 30,
                sfColor: Theme.of(context).primaryColor,
                labelColor: Theme.of(context).primaryColor,
                borderColor: Theme.of(context).primaryColor,
                textColor: Theme.of(context).accentColor,
              ),

      Expanded(
          child: testing(list),
      ),
            ],
          ),
      );
          },
        );
      }


 Widget testing(list)=> ConditionalBuilder(
  condition: list.length>0,
  builder: (context)=>ListView.separated(
  itemBuilder: (context, index)
  => buildArticleItem(list[index],context),
  separatorBuilder: (context, index) => Divider(
  color: NewsAppCubit.get(context).isDark?Colors.cyan:Colors.deepOrange,  indent: 15,
  endIndent: 15,
  ),
  itemCount: list.length,
  ),
  fallback: (context)=>Center(child: Text('Searching',style: Theme.of(context).textTheme.bodyText1,),),
  );
}
