import 'package:bloc/bloc.dart';
import 'package:route_news_project/category_details/cubit/states.dart';

import '../../api/api_manager.dart';
import '../../repository/source_repository/data_source/source_remote_data_source.dart';
import '../../repository/source_repository/source_repository.dart';

class CategoryDetailsViewModel extends Cubit<SourceStates> {
  ///todo: viewModel will talk with the repository (has an object of the repository)
  late SourceRepositoryContract repositoryContract;

  CategoryDetailsViewModel() : super(SourceLoadingState()) {
    ///todo: you can't make an object of the abstract class
    repositoryContract = SourceRepositoryImpl(
        remoteDataSource: SourceRemoteDataSourceImpl(apiManager: ApiManager()));
  }

  void getSourceByCategoryId(String categoryId) async {
    try {
      var response = await repositoryContract.getSourceByCategoryId(categoryId);
      if (response?.status == 'error') {
        emit(SourceErrorState(errorMessage: response?.message ?? ''));
      } else {
        emit(SourceSuccessState(sourceList: response?.sources ?? []));
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: 'Something Went Wrong!'));
    }
  }
}
