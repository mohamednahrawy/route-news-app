import 'package:route_news_project/models/SourceResponse.dart';

import 'data_source/source_remote_data_source.dart';

//todo:abstract class for the repository (interface) includes abstract methods only
abstract class SourceRepositoryContract {
  Future<SourceResponse?> getSourceByCategoryId(String categoryId);
}

class SourceRepositoryImpl implements SourceRepositoryContract {
  ///todo: SourceRepository to work needs its DataSource (object)
  final SourceRemoteDataSource remoteDataSource;

  SourceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<SourceResponse?> getSourceByCategoryId(String categoryId) {
    return remoteDataSource.getSourcesByCategoryId(categoryId);
  }
}

SourceRepositoryContract injectSourceRepositoryContract() {
  return SourceRepositoryImpl(remoteDataSource: injectSourceRemoteDataSource());
}
