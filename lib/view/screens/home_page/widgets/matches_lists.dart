import 'package:assign_linkdin/model/apis/api_response.dart';
import 'package:assign_linkdin/model/apis/end_points.dart';
import 'package:assign_linkdin/model/models/matches_list_model.dart';
import 'package:assign_linkdin/shimmer.dart';
import 'package:assign_linkdin/shimmers/shimmer_container.dart';
import 'package:assign_linkdin/shimmers/shimmer_loading.dart';
import 'package:assign_linkdin/view_model/cricket_view_provider.dart';
import 'package:flutter/rendering.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MatchListData extends StatefulWidget {
  const MatchListData({super.key});

  @override
  State<MatchListData> createState() => _MatchListDataState();
}

class _MatchListDataState extends State<MatchListData> {
  @override
  void initState() {
    final provider = Provider.of<CricketViewProvider>(context, listen: false);
    provider.fetchMatchesList(ApiEndPoint().matchesList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<CricketViewProvider>(
      builder: (BuildContext context, provider, Widget? widget) {
        if (provider.response1.status == Status.INITIAL) {
          return ShimmerContainer();
        } else if (provider.response1.status == Status.COMPLETED) {
          final matchesList = provider.response1.data as MatchesListModel;
          List<SeriesMatch> matchList = [];
          for( var match in matchesList.typeMatches!){
            if(match.matchType=='International'){
             for(var matchi in match.seriesMatches!){
               matchList.add(matchi);
             }
            }
          }
          return SliverToBoxAdapter(
              child: SizedBox(
            height: size.height * .2,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: matchList.length,
                itemBuilder: (context, index) => Container(
            padding: EdgeInsets.all(size.width * .02),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.black12),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            width: size.width,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             // Text(matchList[index].),
                SizedBox(
                  height: 10,
                ),

                Container(
                  color: Colors.black12,
                  height: size.height * .03,
                  width: size.width,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.black12,
                  height: size.height * .02,
                  width: size.width * .1,
                )
              ],
            ),
          ))));
        } else {
          return SliverToBoxAdapter(
            child: Text('Something went Wrong'),
          );
        }
      },
    );
  }
}
