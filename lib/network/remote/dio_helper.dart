import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../model/news_model.dart';

class ApiProvider{
  NewsStory? newsStory;
  Future <NewsStory?> getData() async {
    Response response=  await Dio().get("https://newsapi.org/v2/everything?q=apple&from=2022-08-18&to=2022-08-18&sortBy=popularity&apiKey=21ad6b96f9824836b9407e18a89b2b32");
    newsStory=NewsStory.fromJson(response.data);
    if (kDebugMode) {
     // print(response.data);
    }
    return newsStory;
  }
}