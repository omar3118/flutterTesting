import 'package:app01/layout/news_app/cubit/news_app_cubit.dart';
import 'package:app01/layout/news_app/cubit/news_app_states.dart';
import 'package:app01/modules/news_app/search/search_screen.dart';
import 'package:app01/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      buildWhen: (priv,curr){
        print('inNewsBW');
        if (curr is NewsGetSearchLoading || curr is NewsGetSearchSuccess)
          return false;
        else
          return true;
      },
      listener: (context, state) {
        print('inNewsL');
      },
      builder: (context, state) {
        print('inNews');
        NewsAppCubit cubit = NewsAppCubit.get(context);
        int currentIndex = cubit.selectedIndex;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'NewsApp',
            ),
            actions: [
              IconButton(onPressed: (){   Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));print('Testing');}, icon: Icon(Icons.search)),
              IconButton(onPressed: ()=>cubit.changeThemeMode(), icon: Icon(Icons.brightness_6_outlined,color: cubit.isDark?Colors.white:Colors.black,))
            ],
          ),
          body: cubit.object[currentIndex],
          bottomNavigationBar: cubit.bottomNavBar(),
        );
      },
    );
  }
}
