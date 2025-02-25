import 'package:assign_linkdin/model/apis/end_points.dart';
import 'package:assign_linkdin/model/models/matches_list_model.dart';
import 'package:assign_linkdin/model/models/news_details_model.dart';
import 'package:assign_linkdin/model/models/news_model.dart';
import 'package:assign_linkdin/model/models/response_model.dart';
import 'package:assign_linkdin/model/services/base_service.dart';
import 'package:assign_linkdin/model/services/cricket_service.dart';
import 'package:web_socket_channel/status.dart';

import '../view/screens/home_page/widgets/matches_lists.dart';

class CricketRepository {
  final BaseService _cricketService = CricketService();

  Future<dynamic> fetchNewsList(String value) async {
    final response = await _cricketService.getResponse(value);
    return News.fromJson(response);
  }

  Future<dynamic> fetchNewsDetails(String value) async {
    final response = await _cricketService.getResponse(value);

    return NewsDetailsModel.fromJson(response);
  }

  Future<dynamic> fetchMatchesList(String value) async{
    final response = await _cricketService.getResponse(value);
    return MatchesListModel.fromJson(response);
  }

  Future<dynamic> fetchImage(String value) async {
    final res = await _cricketService.getResponse(value);
    return res;
  }
}
