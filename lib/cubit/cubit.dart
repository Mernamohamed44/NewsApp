import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/state.dart';
import 'package:news_app/moudels/science_screen.dart';
import 'package:news_app/moudels/setting_screen.dart';
import 'package:news_app/moudels/sports_screen.dart';

import '../model/news_model.dart';
import '../moudels/business_screen.dart';
import '../network/remote/dio_helper.dart';


class NewsCubit extends Cubit<NewsStates> {
  NewsCubit(BuildContext context) : super(InitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int  currentIndex=0;
  List<BottomNavigationBarItem> bottomNav=[
    const BottomNavigationBarItem(icon:  Icon(Icons.business),label:'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports),label:'Sports'),
    const BottomNavigationBarItem(icon:  Icon(Icons.science),label:'science'),
    const BottomNavigationBarItem(icon: Icon(Icons.settings),label:'setting'),
  ];
  List<Widget>screens=[
     BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
     const SettingsScreen()
  ];
  changeBottomNave(index){
    currentIndex=index;
    emit(BottomNavState());
  }
  NewsStory ?newsStory;
  List <dynamic> ?business = [];
  void getData() async {
    emit(GetNewsLoadingState());
    newsStory = await ApiProvider().getData().
    then((value) {
      business= value?.articles;
      print("the print= ${value?.articles![2].title}");
      emit(GetNewsSuccessState());
    }
    ).catchError((error){
      print("the error is ${error.toString()}");
      emit(GetNewsErrorState());
    });
  }
}
