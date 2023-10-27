import 'package:bloc/bloc.dart';
import 'package:route_news_project/category_details/tab_container/cubit/states.dart';

import '../repository/source_repository.dart';

class CategoryDetailsViewModel extends Cubit<SourceStates> {
  SourceRepositoryContract repositoryContract;

  CategoryDetailsViewModel({required this.repositoryContract})
      : super(SourceLoadingState());

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
