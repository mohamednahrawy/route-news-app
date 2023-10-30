import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:route_news_project/models/NewsResponse.dart';

import '../models/SourceResponse.dart';
import 'api_constants.dart';

class ApiManager {
  ///todo: singleton Pattern
  ///todo: you can make the constructor private also to prevent anyone to make an object
  ///todo: of the ApiManager by:    ApiManager._(); you close making any object of the class
  static ApiManager? _instance; //null - ApiManager()

  static ApiManager getInstance() {
    ///todo: null aware assignment
    _instance ??= ApiManager();
    return _instance!;
  }

  Future<SourceResponse> getSourcesByCategoryId(String categoryId) async {
    /*
    https://newsapi.org/v2/top-headlines/sources?apiKey=c36ceaa72aa34977b194cb5ea039aed5
     */
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceApi,
        {'apiKey': 'c36ceaa72aa34977b194cb5ea039aed5', 'category': categoryId});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    /*
    https://newsapi.org/v2/everything?q=bitcoin&apiKey=c36ceaa72aa34977b194cb5ea039aed5
     */
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi,
        {'apiKey': 'c36ceaa72aa34977b194cb5ea039aed5', 'sources': sourceId});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw (e);
    }
  }
}
