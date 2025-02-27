// To parse this JSON data, do
//
//     final News = NewsFromJson(jsonString);

import 'dart:convert';

ResponseModel NewsFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  List<TypeMatch> typeMatches;
  Filters filters;
  AppIndex appIndex;
  String responseLastUpdated;
  // List<ContentFilter>? contentFilters;

  ResponseModel({
    required this.typeMatches,
    required this.filters,
    required this.appIndex,
    required this.responseLastUpdated,
    // this.contentFilters,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        typeMatches: List<TypeMatch>.from(
            json["typeMatches"].map((x) => TypeMatch.fromJson(x))),
        filters: Filters.fromJson(json["filters"]),
        appIndex: AppIndex.fromJson(json["appIndex"]),
        responseLastUpdated: json["responseLastUpdated"],
        // contentFilters: List<ContentFilter>.from(
        //     json["contentFilters"].map((x) => ContentFilter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "typeMatches": List<dynamic>.from(typeMatches.map((x) => x.toJson())),
        "filters": filters.toJson(),
        "appIndex": appIndex.toJson(),
        "responseLastUpdated": responseLastUpdated,
        // "contentFilters": contentFilters != null
        //     ? List<dynamic>.from(contentFilters!.map((x) => x.toJson()))
        //     : null,
      };
}

class AppIndex {
  String seoTitle;
  String webUrl;

  AppIndex({
    required this.seoTitle,
    required this.webUrl,
  });

  factory AppIndex.fromJson(Map<String, dynamic> json) => AppIndex(
        seoTitle: json["seoTitle"],
        webUrl: json["webURL"],
      );

  Map<String, dynamic> toJson() => {
        "seoTitle": seoTitle,
        "webURL": webUrl,
      };
}

class ContentFilter {
  String filterId;
  String filterName;

  ContentFilter({
    required this.filterId,
    required this.filterName,
  });

  factory ContentFilter.fromJson(Map<String, dynamic> json) => ContentFilter(
        filterId: json["filterId"],
        filterName: json["filterName"],
      );

  Map<String, dynamic> toJson() => {
        "filterId": filterId,
        "filterName": filterName,
      };
}

class Filters {
  List<String> matchType;

  Filters({
    required this.matchType,
  });

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        matchType: List<String>.from(json["matchType"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "matchType": List<dynamic>.from(matchType.map((x) => x)),
      };
}

class TypeMatch {
  String matchType;
  List<SeriesMatch> seriesMatches;

  TypeMatch({
    required this.matchType,
    required this.seriesMatches,
  });

  factory TypeMatch.fromJson(Map<String, dynamic> json) => TypeMatch(
        matchType: json["matchType"],
        seriesMatches: List<SeriesMatch>.from(
            json["seriesMatches"].map((x) => SeriesMatch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "matchType": matchType,
        "seriesMatches":
            List<dynamic>.from(seriesMatches.map((x) => x.toJson())),
      };
}

class SeriesMatch {
  SeriesAdWrapper? seriesAdWrapper;
  AdDetail? adDetail;

  SeriesMatch({
    this.seriesAdWrapper,
    this.adDetail,
  });

  factory SeriesMatch.fromJson(Map<String, dynamic> json) => SeriesMatch(
        seriesAdWrapper: json["seriesAdWrapper"] == null
            ? null
            : SeriesAdWrapper.fromJson(json["seriesAdWrapper"]),
        adDetail: json["adDetail"] == null
            ? null
            : AdDetail.fromJson(json["adDetail"]),
      );

  Map<String, dynamic> toJson() => {
        "seriesAdWrapper": seriesAdWrapper?.toJson(),
        "adDetail": adDetail?.toJson(),
      };
}

class AdDetail {
  String name;
  String layout;
  int position;

  AdDetail({
    required this.name,
    required this.layout,
    required this.position,
  });

  factory AdDetail.fromJson(Map<String, dynamic> json) => AdDetail(
        name: json["name"],
        layout: json["layout"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "layout": layout,
        "position": position,
      };
}

class SeriesAdWrapper {
  int seriesId;
  String seriesName;
  List<Match> matches;
  bool? isLiveStreamEnabled;

  SeriesAdWrapper({
    required this.seriesId,
    required this.seriesName,
    required this.matches,
    this.isLiveStreamEnabled,
  });

  factory SeriesAdWrapper.fromJson(Map<String, dynamic> json) =>
      SeriesAdWrapper(
        seriesId: json["seriesId"],
        seriesName: json["seriesName"],
        matches:
            List<Match>.from(json["matches"].map((x) => Match.fromJson(x))),
        isLiveStreamEnabled: json["isLiveStreamEnabled"],
      );

  Map<String, dynamic> toJson() => {
        "seriesId": seriesId,
        "seriesName": seriesName,
        "matches": List<dynamic>.from(matches.map((x) => x.toJson())),
        "isLiveStreamEnabled": isLiveStreamEnabled,
      };
}

class Match {
  MatchInfo matchInfo;
  MatchScore? matchScore;

  Match({
    required this.matchInfo,
    this.matchScore,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        matchInfo: MatchInfo.fromJson(json["matchInfo"]),
        matchScore: json["matchScore"] == null
            ? null
            : MatchScore.fromJson(json["matchScore"]),
      );

  Map<String, dynamic> toJson() => {
        "matchInfo": matchInfo.toJson(),
        "matchScore": matchScore?.toJson(),
      };
}

class MatchInfo {
  int matchId;
  int seriesId;
  String seriesName;
  String matchDesc;
  MatchFormat matchFormat;
  String startDate;
  String endDate;
  State? state;
  String status;
  Team team1;
  Team team2;
  VenueInfo venueInfo;
  String seriesStartDt;
  String seriesEndDt;
  bool isTimeAnnounced;
  String stateTitle;
  int? currBatTeamId;
  bool? isFantasyEnabled;

  MatchInfo({
    required this.matchId,
    required this.seriesId,
    required this.seriesName,
    required this.matchDesc,
    required this.matchFormat,
    required this.startDate,
    required this.endDate,
    this.state,
    required this.status,
    required this.team1,
    required this.team2,
    required this.venueInfo,
    required this.seriesStartDt,
    required this.seriesEndDt,
    required this.isTimeAnnounced,
    required this.stateTitle,
    this.currBatTeamId,
    this.isFantasyEnabled,
  });

  factory MatchInfo.fromJson(Map<String, dynamic> json) => MatchInfo(
        matchId: json["matchId"],
        seriesId: json["seriesId"],
        seriesName: json["seriesName"],
        matchDesc: json["matchDesc"],
        matchFormat: matchFormatValues.map[json["matchFormat"]]!,
        startDate: json["startDate"],
        endDate: json["endDate"],
        state: stateValues.map[json["state"]],
        status: json["status"],
        team1: Team.fromJson(json["team1"]),
        team2: Team.fromJson(json["team2"]),
        venueInfo: VenueInfo.fromJson(json["venueInfo"]),
        seriesStartDt: json["seriesStartDt"],
        seriesEndDt: json["seriesEndDt"],
        isTimeAnnounced: json["isTimeAnnounced"],
        stateTitle: json["stateTitle"],
        currBatTeamId: json["currBatTeamId"],
        isFantasyEnabled: json["isFantasyEnabled"],
      );

  Map<String, dynamic> toJson() => {
        "matchId": matchId,
        "seriesId": seriesId,
        "seriesName": seriesName,
        "matchDesc": matchDesc,
        "matchFormat": matchFormatValues.reverse[matchFormat],
        "startDate": startDate,
        "endDate": endDate,
        "state": stateValues.reverse[state],
        "status": status,
        "team1": team1.toJson(),
        "team2": team2.toJson(),
        "venueInfo": venueInfo.toJson(),
        "seriesStartDt": seriesStartDt,
        "seriesEndDt": seriesEndDt,
        "isTimeAnnounced": isTimeAnnounced,
        "stateTitle": stateTitle,
        "currBatTeamId": currBatTeamId,
        "isFantasyEnabled": isFantasyEnabled,
      };
}

enum MatchFormat { ODI, T20, TEST }

final matchFormatValues = EnumValues(
    {"ODI": MatchFormat.ODI, "T20": MatchFormat.T20, "TEST": MatchFormat.TEST});

enum State { COMPLETE }

final stateValues = EnumValues({"Complete": State.COMPLETE});

class Team {
  int teamId;
  String teamName;
  String teamSName;
  int imageId;

  Team({
    required this.teamId,
    required this.teamName,
    required this.teamSName,
    required this.imageId,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        teamId: json["teamId"],
        teamName: json["teamName"],
        teamSName: json["teamSName"],
        imageId: json["imageId"],
      );

  Map<String, dynamic> toJson() => {
        "teamId": teamId,
        "teamName": teamName,
        "teamSName": teamSName,
        "imageId": imageId,
      };
}

class VenueInfo {
  dynamic id;
  String ground;
  String city;
  String timezone;
  dynamic latitude;
  dynamic longitude;

  VenueInfo({
     this.id,
    required this.ground,
    required this.city,
    required this.timezone,
     this.latitude,
     this.longitude,
  });

  factory VenueInfo.fromJson(Map<String, dynamic> json) => VenueInfo(
        id: json["id"],
        ground: json["ground"],
        city: json["city"],
        timezone: json["timezone"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ground": ground,
        "city": city,
        "timezone": timezone,
        "latitude": latitude,
        "longitude": longitude,
      };
}

class MatchScore {
  TeamScore team1Score;
  TeamScore? team2Score;

  MatchScore({
    required this.team1Score,
    this.team2Score,
  });

  factory MatchScore.fromJson(Map<String, dynamic> json) => MatchScore(
        team1Score: TeamScore.fromJson(json["team1Score"]),
        team2Score: json["team2Score"] == null
            ? null
            : TeamScore.fromJson(json["team2Score"]),
      );

  Map<String, dynamic> toJson() => {
        "team1Score": team1Score.toJson(),
        "team2Score": team2Score?.toJson(),
      };
}

class TeamScore {
  Inngs? inngs1;
  Inngs? inngs2;

  TeamScore({
    required this.inngs1,
    this.inngs2,
  });

  factory TeamScore.fromJson(Map<String, dynamic> json) => TeamScore(
        inngs1: json['inning1']==null?null:Inngs.fromJson(json["inngs1"]),
        inngs2:  json['inning1']==null?null:Inngs.fromJson(json["inngs2"]),
      );

  Map<String, dynamic> toJson() => {
        "inngs1": inngs1?.toJson(),
        "inngs2": inngs2?.toJson(),
      };
}

class Inngs {
  int inningsId;
  int runs;
  int? wickets;
  double overs;
  bool? isDeclared;

  Inngs({
    required this.inningsId,
    required this.runs,
     required this.wickets,
    required this.overs,
    this.isDeclared,
  });

  factory Inngs.fromJson(Map<String, dynamic> json) => Inngs(
        inningsId: json["inningsId"],
        runs: json["runs"],
        wickets: json["wickets"] ??0,
        overs: json["overs"]?.toDouble(),
        isDeclared: json["isDeclared"],
      );

  Map<String, dynamic> toJson() => {
        "inningsId": inningsId,
        "runs": runs,
        "wickets": wickets,
        "overs": overs,
        "isDeclared": isDeclared,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
