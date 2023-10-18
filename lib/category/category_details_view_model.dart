import 'package:flutter/cupertino.dart';

import '../api/api_manager.dart';
import '../models/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  ///includes provider for data and methods for the view
  List<Source>? sourcesList;
  String? errorMessage;

  void getSource() async {
    sourcesList = null;
    errorMessage = null;
    try {
      var response = await ApiManager.getSources();
      if (response.status == 'error') {
        errorMessage = response.message;
      } else {
        sourcesList = response.sources;
      }

      ///client error
    } catch (e) {
      errorMessage = 'Error Loading Sources List';
    }
    notifyListeners();
  }
}
