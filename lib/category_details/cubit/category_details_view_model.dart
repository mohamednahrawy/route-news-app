import 'package:bloc/bloc.dart';
import 'package:route_news_project/category_details/cubit/states.dart';

import '../../api/api_manager.dart';

class CategoryDetailsViewModel extends Cubit<SourceStates> {
  CategoryDetailsViewModel() : super(SourceLoadingState());

  void getSourceByCategoryId(String categoryId) async {
    try {
      var response = await ApiManager.getSourcesByCategoryId(categoryId);
    } catch (e) {}
  }
}
