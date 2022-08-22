import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/state.dart';
import 'package:news_app/moudels/science_screen.dart';
import 'package:news_app/moudels/setting_screen.dart';
import 'package:news_app/moudels/sports_screen.dart';
import 'package:news_app/network/local/cached_helper.dart';
import '../model/news_model.dart';
import '../moudels/business_screen.dart';
import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit(BuildContext context) : super(InitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomNav = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
    const BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'setting'),
  ];
  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const SettingsScreen()
  ];
  changeBottomNave(index) {
    currentIndex = index;
    emit(BottomNavState());
  }

  NewsStory? newsStory1;
  NewsStory? newsStory2;
  NewsStory? newsStory3;
  List<dynamic>? business = [];
  List<dynamic>? sports = [];
  List<dynamic>? science = [];
  List<dynamic>? search = [];
  void getDataBusiness() async {
    emit(GetBusinessNewsLoadingState());
    newsStory1 = await ApiProvider().getBusinessData().then((value) {
      business = value?.articles;
      print("the print= ${value?.articles![2].title}");
      emit(GetBusinessNewsSuccessState());
    }).catchError((error) {
      print("the error is ${error.toString()}");
      emit(GetBusinessNewsErrorState());
    });
  }

  void getDataSports() async {
    emit(GetSportsNewsLoadingState());
    newsStory2 = await ApiProvider().getSportsData().then((value) {
      sports = value?.articles;
      print("the print= ${value?.articles![2].title}");
      emit(GetSportsNewsSuccessState());
    }).catchError((error) {
      print("the error is ${error.toString()}");
      emit(GetSportsNewsErrorState());
    });
  }

  void getDataScience() async {
    emit(GetScienceNewsLoadingState());
    newsStory3 = await ApiProvider().getScienceData().then((value) {
      science = value?.articles;
      print("the print= ${value?.articles![2].title}");
      emit(GetScienceNewsSuccessState());
    }).catchError((error) {
      print("the error is ${error.toString()}");
      emit(GetScienceNewsErrorState());
    });
  }

  bool isDark = false;
  changeMode({bool? fromShared}) {
    if (fromShared != null) {
      fromShared = isDark;
    } else {
      isDark = !isDark;
    }
    CachedHelper.putBoolean(key: 'isDark', value: isDark)
        .then((value) => emit(DarkModeChangeState()));
  }

  void getDataSearch(String value) async {
    emit(GetSearchNewsLoadingState());
    newsStory3 = await ApiProvider().getSearch(value).then((value) {
      search = value?.articles;
      print("the print= ${value?.articles![2].title}");
      emit(GetSearchNewsSuccessState());
    }).catchError((error) {
      print("the error is ${error.toString()}");
      emit(GetSearchNewsErrorState());
    });
  }
}
