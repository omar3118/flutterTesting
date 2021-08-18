import 'package:app01/layout/news_app/cubit/news_app_cubit.dart';
import 'package:app01/layout/news_app/cubit/news_app_states.dart';
import 'package:app01/shared/components/components.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sciences extends StatelessWidget {

  @override
  Widget build(BuildContext context) =>BlocConsumer<NewsAppCubit,NewsAppStates>(
  listener: (context,state){},
  builder:(context,state) {
  var list= NewsAppCubit.get(context).science;
  return ConditionalBuilder(
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
  );
  },
  );
}
