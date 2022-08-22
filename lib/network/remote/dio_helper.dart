import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../model/news_model.dart';

class ApiProvider {
  NewsStory? newsStory;
  Future<NewsStory?> getBusinessData() async {
    Response response = await Dio().get(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=21ad6b96f9824836b9407e18a89b2b32");
    newsStory = NewsStory.fromJson(response.data);
    if (kDebugMode) {
      // print(response.data);
    }
    return newsStory;
  }

  Future<NewsStory?> getSportsData() async {
    Response response = await Dio().get(
        "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=21ad6b96f9824836b9407e18a89b2b32");
    newsStory = NewsStory.fromJson(response.data);
    if (kDebugMode) {
      // print(response.data);
    }
    return newsStory;
  }

  Future<NewsStory?> getScienceData() async {
    Response response = await Dio().get(
        "https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=21ad6b96f9824836b9407e18a89b2b32");
    newsStory = NewsStory.fromJson(response.data);
    if (kDebugMode) {
      // print(response.data);
    }
    return newsStory;
  }

  Future<NewsStory?> getSearch(String value) async {
    Response response = await Dio().get(
        "https://newsapi.org/v2/everything?q=$value=2022-08-21&to=2022-08-21&sortBy=popularity&apiKey=21ad6b96f9824836b9407e18a89b2b32");
    newsStory = NewsStory.fromJson(response.data);
    if (kDebugMode) {
      // print(response.data);
    }
    return newsStory;
  }
}
