import 'package:dio/dio.dart';
import 'package:flutter_dio/models/apiModel.dart';
class ApiHelper{
  String url = 'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=68f815ee26d444c1ad46edbc0a5e0b51';
   var newsModel;
   Future<NewsModel> getData() async {
  try {
    Response response = await Dio().get(url);
   // print(response.data);
    NewsModel newsModel = NewsModel.fromJson(response.data);
    print(newsModel.articles);
    return newsModel;
  } catch (error) {
    return newsModel;
  } 
}
}
