import 'package:assign_linkdin/model/models/response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Row rowDataWidget(String teamName, Inngs? teamScore) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // Image.network(
      //     "https://cricbuzz-cricket.p.rapidapi.com/matches/v1/recent/images/${snapshot.data![index].matchInfo.team1.imageId.toString()}"),
      Text(
        teamName,
        style: style2,
      ),
      if (teamScore != null)
        Text("${teamScore.runs}/${teamScore.wickets} (${teamScore.overs})",
            style: style2)
    ],
  );
}

const TextStyle style1 =
    TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800);

const TextStyle style2 =
    TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w500);

const TextStyle style3 =
    TextStyle(color: Colors.white70, fontSize: 15, fontWeight: FontWeight.bold);
