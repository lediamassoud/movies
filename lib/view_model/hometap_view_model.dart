import 'package:flutter/material.dart';
import 'package:movies_app/data/api_manger.dart';
import 'package:movies_app/models/popular_response.dart';
import 'package:movies_app/models/results.dart';

class HomeTapViewModel extends ChangeNotifier{
  TapsWidgetsState state = TapsWidgetsState.loading;
  List<Results> results = [];
  String errorMessage = "";
  Future<void> loadArticlesList(String sourceId,String query) async {
    state = TapsWidgetsState.loading;
    notifyListeners();
    try {
      PopularResponse popularResponse =
      await ApiManager.loadPopular();
      state = TapsWidgetsState.success;
      results = articlesResponse.articles!;
      notifyListeners();
    } catch (exception) {
      state = TapsWidgetsState.error;
      errorMessage = exception.toString();
      notifyListeners();
    }
  }
}
enum TapsWidgetsState { success, loading, error }