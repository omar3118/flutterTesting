import 'package:app01/layout/news_app/cubit/news_app_states.dart';
import 'package:app01/modules/news_app/business/business_screen.dart';
import 'package:app01/modules/news_app/science/science_screen.dart';
import 'package:app01/modules/news_app/setting/setting_screen.dart';
import 'package:app01/modules/news_app/sport/sport_screen.dart';
import 'package:app01/shared/network/local/cache_helper.dart';
import 'package:app01/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsAppCubit extends Cubit<NewsAppStates> {
  NewsAppCubit() : super(InitialState());

    static NewsAppCubit get(context) => BlocProvider.of<NewsAppCubit>(context);

  bool isDark = CacheHelper.getBool(key: 'isDark') == null
      ? false
      : CacheHelper.getBool(key: 'isDark');

  int selectedIndex = 0;

  String apiKey = 'ae162348b31f4b5ea224fae78bd62b7c';

  List business = [];
  List sports = [];
  List science = [];
  List search = [];

  List<Widget> object = [
    Business(),
    Sport(),
    Sciences(),
    Setting(),
  ];

  Widget bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (value) {
        selectedIndex = value;
        emit(ChangeBottomNav());
      },
      items: [
        BottomNavigationBarItem(
            label: "Business", icon: Icon(Icons.business_center_outlined)),
        BottomNavigationBarItem(label: "Sports", icon: Icon(Icons.sports)),
        BottomNavigationBarItem(
            label: "Science", icon: Icon(Icons.science_outlined)),
        BottomNavigationBarItem(label: "Settings", icon: Icon(Icons.settings)),
      ],
    );
  }

  void changeThemeMode() {
    isDark = !isDark;
    CacheHelper.setBool(key: 'isDark', value: isDark)
        .then((value) => emit(ChangeThemeMode()));
  }

  void getSearch(String sear) {
    if (sear.isNotEmpty) {
      DioHelper.getData(url: 'v2/everything', query: {
        'q': sear,
        'apiKey': apiKey,
      }).then((value) {
        search = value.data['articles'];
        print(search[0]['title']);
        emit(NewsGetSearchSuccess());
      }).catchError((er) {
        print('ErrorInSearch /// : ${er.toString()}');
        emit(NewsGetSearchError());
      });
    } else
      search.clear();
    emit(NewsGetSearchLoading());
  }

  void getBusiness() {
    emit(NewsGetBusinessLoading());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'ae',
      'category': 'business',
      'apiKey': apiKey,
    }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccess());
    }).catchError((er) {
      print('ErrorInBusiness /// : ${er.toString()}');
      emit(NewsGetBusinessError());
    });
  }

  void getSports() {
    emit(NewsGetSportsLoading());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'ae',
      'category': 'sports',
      'apiKey': apiKey,
    }).then((value) {
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccess());
    }).catchError((er) {
      print('ErrorInSports /// : ${er.toString()}');
      emit(NewsGetSportsError());
    });
  }

  void getScience() {
    emit(NewsGetScienceLoading());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'ae',
      'category': 'science',
      'apiKey': apiKey,
    }).then((value) {
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccess());
    }).catchError((er) {
      print('ErrorInScience /// : ${er.toString()}');
      emit(NewsGetScienceError());
    });
  }
}
