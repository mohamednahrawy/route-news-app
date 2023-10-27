import 'package:route_news_project/api/api_manager.dart';
import 'package:route_news_project/models/SourceResponse.dart';

///todo: abstract class for the data source (interface) includes abstract method
abstract class SourceRemoteDataSource {
  Future<SourceResponse?> getSourcesByCategoryId(String categoryId);
}

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  final ApiManager apiManager;

  SourceRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<SourceResponse?> getSourcesByCategoryId(String categoryId) async {
    var response = await apiManager.getSourcesByCategoryId(categoryId);
    return response;
  }
}

SourceRemoteDataSource injectSourceRemoteDataSource() {
  return SourceRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
