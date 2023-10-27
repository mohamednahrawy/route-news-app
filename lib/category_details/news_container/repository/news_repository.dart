import '../../../models/NewsResponse.dart';
import 'data_source/news_remote_data_source.dart';

abstract class NewsRepositoryContract {
  Future<NewsResponse> getNewsBySourceId(String sourceId);
}

class NewsRepositoryImpl implements NewsRepositoryContract {
  NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId) {
    return remoteDataSource.getNewsBySourceId(sourceId);
  }
}

NewsRepositoryContract injectNewsRepositoryContract() {
  return NewsRepositoryImpl(remoteDataSource: injectNewsRemoteDataSource());
}
