import 'package:assign_linkdin/model/models/matches_list_model.dart';
import 'package:assign_linkdin/model/models/news_details_model.dart';
import 'package:assign_linkdin/model/models/news_model.dart';
import 'package:assign_linkdin/model/models/response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/apis/api_response.dart';
import '../model/response_repositories.dart';

class CricketViewProvider with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');
  ApiResponse _apiResponse1 = ApiResponse.initial('Empty data');

  ApiResponse get response => _apiResponse;

  ApiResponse get response1 => _apiResponse1;

  void fetchMatchesList(String value) async {
    try {
      _apiResponse = ApiResponse.initial('loading');
      MatchesListModel matchesListModel =
          await CricketRepository().fetchMatchesList(value);
      // MatchesListModel matchesListModel =
      // await CricketRepository().fetchMatchesList(value);
      // MatchesListModel matchesListModel =
      // await CricketRepository().fetchMatchesList(value);

      _apiResponse1 = ApiResponse.completed(matchesListModel);
      notifyListeners();
    } catch (e) {
      _apiResponse1 = ApiResponse.error('Failed to fetch news details: $e');
      notifyListeners(); // Notify listeners of the error
      throw e;
    }
  }

  Future<NewsDetailsModel> fetchNewsDetails(String value) async {
    try {
      _apiResponse = ApiResponse.initial('loading');
      return await CricketRepository().fetchNewsDetails(value);
    } catch (e) {
      _apiResponse = ApiResponse.error('Failed to fetch news details: $e');
      notifyListeners(); // Notify listeners of the error
      throw e; //
    }
  }

  void fetchNewsList(String value) async {
    try {
      _apiResponse = ApiResponse.initial('loading');
      News responseModel = await CricketRepository().fetchNewsList(value);
      _apiResponse = ApiResponse.completed(responseModel);
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Failed to fetch news details: $e');
      notifyListeners();
      throw e;
    }
  }

  Future<dynamic> fetchImage(String value) async {
    try {
      _apiResponse = ApiResponse.initial('loading');
      // notifyListeners();
      dynamic imageData = await CricketRepository().fetchImage(value);
      notifyListeners();
      return imageData;
    } catch (e) {
      _apiResponse = ApiResponse.error('Failed to fetch news details: $e');
      notifyListeners(); // Notify listeners of the error
      throw e; //
    }
  }
}
