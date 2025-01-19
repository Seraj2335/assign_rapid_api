import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api_services.dart';
import 'package:intl/intl.dart';

import '../common.dart';
import '../response_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Color(0xff303030),
          appBar: AppBar(
              backgroundColor: Color(0xff303030),
              title: Text(
                'Big Bash League 2024-2025',
                style: TextStyle(color: Colors.white),
              ),
              bottom: TabBar(
                tabs: [
                  Text(
                    'Live',
                  ),
                  Text(
                    'Upcoming',
                  ),
                  Text(
                    'Recent',
                  )
                ],
                labelPadding: EdgeInsets.only(bottom: size.height * .015),
                labelStyle: style3,
                unselectedLabelColor: Colors.white38,
                padding: EdgeInsets.zero,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicatorWeight: .5,
              )),
          body: TabBarView(children: [
            FutureClass(type: 'live'),
            FutureClass(type: 'upcoming'),
            FutureClass(type: 'recent')
          ]),
        ));
  }
}

class FutureClass extends StatelessWidget {
  final String type;

  const FutureClass({super.key, required this.type});

  Future<List<Match>> getAPIData(type) async {
    final response = await APIService().get(type);
    ResponseModel modelData =
        ResponseModel.fromJson(response as Map<String, dynamic>);
    List<Match> matchList = [];
    for (var match in modelData.typeMatches) {
      if (match.matchType == 'League') {
        for (var seriesMatch in match.seriesMatches) {
          if (seriesMatch.seriesAdWrapper!.seriesName ==
              'Big Bash League 2024-25') {
            matchList.addAll(seriesMatch.seriesAdWrapper!.matches);
          }
        }
      }
    }
    return matchList;
  }

  @override
  Widget build(BuildContext context) {
    getAPIData(type);
    return FutureBuilder<List<Match>>(
        future: getAPIData(type),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return snapshot.data!.isEmpty
              ? Center(
                  child: Text(
                    'No Live Match',
                    style: style3,
                  ),
                )
              : ListData(
                  snapshot: snapshot,
                );
          ;
        });
  }
}

class ListData extends StatelessWidget {
  final AsyncSnapshot<List<Match>> snapshot;

  const ListData({super.key, required this.snapshot});

  String formattedDate(String timeStamp) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(timeStamp));
    return DateFormat('EEE, d MMMM, yyyy').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: size.height * .015),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        final snaps = snapshot.data![index];
        final teams = snaps.matchScore;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * .01, horizontal: size.width * .04),
              child: Text(
                formattedDate(snaps.matchInfo.startDate),
                style: style2,
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * .01, horizontal: size.width * .04),
                color: Color(0xff424242),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text(snaps.matchInfo.matchDesc, style: style1),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(
                              color: Colors.white60, shape: BoxShape.circle),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(snaps.matchInfo.venueInfo.city, style: style1),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    rowDataWidget(snaps.matchInfo.team1.teamName,
                        teams?.team1Score.inngs1),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    rowDataWidget(snaps.matchInfo.team2.teamName,
                        teams?.team2Score?.inngs1),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      snapshot.data![index].matchInfo.status,
                      style: TextStyle(color: Colors.tealAccent),
                    )
                  ],
                )),
          ],
        );
      },
    );
  }
}
