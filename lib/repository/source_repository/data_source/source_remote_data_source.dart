import 'package:route_news_project/api/api_manager.dart';
import 'package:route_news_project/models/SourceResponse.dart';

///todo: abstract class for the data source (interface) includes abstract method
abstract class SourceRemoteDataSource {
  Future<SourceResponse?> getSourcesByCategoryId(String categoryId);
}

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  ///todo: DataSource to work needs the code in the ApiManager class through dot operator
  final ApiManager apiManager;

  SourceRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<SourceResponse?> getSourcesByCategoryId(String categoryId) async {
    ///todo: you can take all the code of the ApiManager
    var response = await apiManager.getSourcesByCategoryId(categoryId);
    return response;
  }
}
