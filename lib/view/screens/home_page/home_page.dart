import 'package:assign_linkdin/view/screens/home_page/widgets/matches_lists.dart';
import 'package:assign_linkdin/view/screens/home_page/widgets/news_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          MatchListData(),
          // NewsList(),
        ],
      )),
    );
  }
}
