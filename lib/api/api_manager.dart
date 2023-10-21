import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:route_news_project/api/api_constants.dart';
import 'package:route_news_project/models/NewsResponse.dart';

import '../models/SourceResponse.dart';

class ApiManager {
  static Future<SourceResponse> getSourcesByCategoryId(
      String categoryId) async {
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

  static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
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
