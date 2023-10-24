import 'package:bloc/bloc.dart';
import 'package:route_news_project/category_details/cubit/states.dart';

import '../../../api/api_manager.dart';

class TabContainerViewModel extends Cubit<SourceStates> {
  TabContainerViewModel() : super(SourceLoadingState());

  void getSourceByCategoryId(String categoryId) async {
    try {
      var response = await ApiManager.getSourcesByCategoryId(categoryId);
      if (response.status == 'error') {
        emit(SourceErrorState(errorMessage: response.message ?? ''));
      } else {
        emit(SourceSuccessState(sourceList: response.sources ?? []));
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: 'Something went wrong!'));
    }
  }
}
