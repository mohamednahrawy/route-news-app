import '../../../models/NewsResponse.dart';

abstract class NewsStates {}

class NewsLoadingState extends NewsStates {}

class NewsErrorState extends NewsStates {
  String errorMessage;

  NewsErrorState({required this.errorMessage});
}

class NewsSuccessState extends NewsStates {
  List<Article> newsList;

  NewsSuccessState({required this.newsList});
}
