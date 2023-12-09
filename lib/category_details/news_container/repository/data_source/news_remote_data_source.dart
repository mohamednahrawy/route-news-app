import '../../../../api/api_manager.dart';
import '../../../../models/NewsResponse.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponse> getNewsBySourceId(String sourceId);
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;

  NewsRemoteDataSourceImpl({required this.apiManager});
///todo: object of ApiManager to get access to its function
  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    return apiManager.getNewsBySourceId(sourceId);
  }
}

NewsRemoteDataSource injectNewsRemoteDataSource() {
  return NewsRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

// ApiManager injectApiManager() {
//   return ApiManager.getInstance();
//   }
// Future<NewsResponse> getNewsBySourceId(String sourceId) async {
//   /*
//     https://newsapi.org/v2/everything?q=bitcoin&apiKey=c36ceaa72aa34977b194cb5ea039aed5
//      */
//   Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi,
//       {'apiKey': 'c36ceaa72aa34977b194cb5ea039aed5', 'sources': sourceId});
//   try {
//     var response = await http.get(url);
//     var bodyString = response.body;
//     var json = jsonDecode(bodyString);
//     return NewsResponse.fromJson(json);
//   } catch (e) {
//     throw (e);
//   }
// }