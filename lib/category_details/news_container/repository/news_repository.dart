import '../../../models/NewsResponse.dart';
import 'data_source/news_remote_data_source.dart';

abstract class NewsRepositoryContract {
  Future<NewsResponse> getNewsBySourceId(String sourceId);
}

class NewsRepositoryImpl implements NewsRepositoryContract {
  NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});
///todo: object of the DataSource to get access to its function
  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId) {
    return remoteDataSource.getNewsBySourceId(sourceId);
  }
}

///todo: will be used in the view
NewsRepositoryContract injectNewsRepositoryContract() {
  return NewsRepositoryImpl(remoteDataSource: injectNewsRemoteDataSource());
}

///todo: view => object of viewModel => object of Repository Contract(injectRepositoryContract())
///todo:  => object of Remote Data Source(injectRemoteDataSource())
///=> object of ApiManager(ApiManager.getInstance);