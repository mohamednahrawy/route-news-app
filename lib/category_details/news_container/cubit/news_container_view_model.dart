import 'package:bloc/bloc.dart';
import 'package:route_news_project/category_details/news_container/cubit/states.dart';

import '../repository/news_repository.dart';

class NewsContainerViewModel extends Cubit<NewsStates> {
  NewsRepositoryContract newsRepositoryContract;

  NewsContainerViewModel({required this.newsRepositoryContract})
      : super(NewsLoadingState());

  void getNewsBySourceId(String sourceId) async {
    try {
      emit(NewsLoadingState());
      var response = await newsRepositoryContract.getNewsBySourceId(sourceId);
      if (response.status == 'error') {
        emit(NewsErrorState(errorMessage: response.message ?? ''));
      } else {
        emit(NewsSuccessState(newsList: response.articles ?? []));
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: 'Something Went Wrong'));
    }
  }
}

///todo: viewModel will talk with its repository (has an object of NewsRepository)

///todo: void function as it execute other function without returning anything
///todo: that's why you wrap it with try{} catch(e){}
