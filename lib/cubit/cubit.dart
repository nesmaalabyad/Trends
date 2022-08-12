import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/dio_helper/dio_helper.dart';
import 'package:news_app/layout/home.dart';
import 'package:news_app/layout/settings.dart';
import 'package:news_app/layout/trends.dart';

import '../components/constance.dart';
import '../dio_helper/signup_and_login_dio_helper.dart';
import 'news_login.dart';


class NewsCubit extends Cubit<Newsstates> {
  NewsCubit() : super(Newsintitialstates());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  int index = 0;
  List<dynamic> sports = [];

  void getSports() {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '804946c446d74bc897d25f4e04d5482f',
      },
    ).then((value) {
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(getsportdatasucssesstate());
    }).catchError((error) {
      print(error.toString());
      emit(getsportdataerrorstate(error.toString()));
    });
  }

  List<dynamic> science = [];

  void getScience() {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': "804946c446d74bc897d25f4e04d5482f",
      },
    ).then((value) {
      science = value.data['articles'];
      print(science[0]['title']);
      emit(getsciencedatasucssesstate());
    }).catchError((error) {
      emit(getsciencedataerrorstate(error.toString()));
    });
  }

  List<dynamic> buisness = [];

  void getBuisness() {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'politics',
        'apiKey': "804946c446d74bc897d25f4e04d5482f",
      },
    ).then((value) {
      buisness = value.data['articles'];
      print(buisness[0]['title']);
      emit(getbuisnessdatasucssesstate());
    }).catchError((error) {
      emit(getbuisnessdataerrorstate(error.toString()));
    });
  }

  List<dynamic> technology = [];

  void getTechnology() {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'technology',
        'apiKey': '804946c446d74bc897d25f4e04d5482f',
      },
    ).then((value) {
      technology = value.data['articles'];
      print(technology[0]['title']);
      emit(getTechnologydatasucssesstate());
    }).catchError((error) {
      print(error.toString());
      emit(getTechnologydataerrorstate(error.toString()));
    });
  }

  List<dynamic> economy = [];

  void getEconomy() {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'apiKey': '804946c446d74bc897d25f4e04d5482f',
      },
    ).then((value) {
      economy = value.data['articles'];
      print(economy[0]['title']);
      emit(geteconomydatasucssesstate());
    }).catchError((error) {
      print(error.toString());
      emit(geteconomydataerrorstate(error.toString()));
    });
  }

  List<dynamic> health = [];

  void gethealth() {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'health',
        'apiKey': '804946c446d74bc897d25f4e04d5482f',
      },
    ).then((value) {
      health = value.data['articles'];
      print(health[0]['title']);
      emit(gethealthdatasucssesstate());
    }).catchError((error) {
      print(error.toString());
      emit(gethealthdataerrorstate(error.toString()));
    });
  }

  List<dynamic> general = [];

  void getgeneral() {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'general',
        'apiKey': '804946c446d74bc897d25f4e04d5482f',
      },
    ).then((value) {
      general = value.data['articles'];
      print(general[0]['title']);
      emit(getgeneraldatasucssesstate());
    }).catchError((error) {
      print(error.toString());
      emit(getgeneraldataerrorstate(error.toString()));
    });
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    // emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'q': '$value',
        'apiKey': '804946c446d74bc897d25f4e04d5482f',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      //print(search[0]['title']);

      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

  List<Widget> Screens = [
    Home(),
    Trends(),
    Settings(),
  ];
  List<String> appbar = [
    'Trends',
    'Trends',
    'Trends',
  ];

  void add(index) {
    currentindex = index;
    emit(buttonLayout());
  }


}
