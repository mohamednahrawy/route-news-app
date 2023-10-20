import 'package:flutter/cupertino.dart';

import '../api/api_manager.dart';
import '../models/NewsResponse.dart';

class NewsContainerViewModel extends ChangeNotifier {
  //holds data - handle logic
  List<Article>? articlesList;
  String? errorMessage;

  void getNewsBySourceId(String sourceId) async {
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response.status == 'error') {
        errorMessage = response.message;
      } else {
        articlesList = response.articles;
      }
    } catch (e) {
      errorMessage = 'Error Loading News List';
    }
    notifyListeners();
  }
}
