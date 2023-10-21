import 'package:flutter/material.dart';
import 'package:route_news_project/api/api_manager.dart';

import '../../models/SourceResponse.dart';

class TabContainerViewModel extends ChangeNotifier {
  //holds list - handle logic
  List<Source>? sourcesList;
  String? errorMessage;

  void getSourcesByCategoryId(String categoryId) async {
    sourcesList = null;
    errorMessage = null;
    try {
      var response = await ApiManager.getSourcesByCategoryId(categoryId);
      if (response.status == 'error') {
        errorMessage = response.message;
      } else {
        sourcesList = response.sources;
      }
    } catch (e) {
      errorMessage = 'Something wrong happened';
    }
    notifyListeners();
  }
}
