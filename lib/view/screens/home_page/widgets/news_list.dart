import 'package:assign_linkdin/model/apis/api_response.dart';
import 'package:assign_linkdin/model/apis/end_points.dart';
import 'package:assign_linkdin/model/routes.dart';
import 'package:assign_linkdin/shimmer.dart';
import 'package:assign_linkdin/view_model/cricket_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../model/models/news_model.dart';
import '../../../../shimmers/shimmer_loading.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NewsList> {
  @override
  void initState() {
    final provider = Provider.of<CricketViewProvider>(context, listen: false);
    provider.fetchNewsList(ApiEndPoint().newsList());
    super.initState();
  }

  final shimmerGradient = LinearGradient(
    colors: [
      Color.fromARGB(231, 235, 235, 244),
      Color.fromARGB(208, 244, 244, 244),
      Color.fromARGB(221, 235, 235, 244),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  @override
  Widget build(BuildContext context) {
    final cTx = context;
    final size = MediaQuery.of(cTx).size;

    return Consumer<CricketViewProvider>(builder: (cTx, provider, widget) {
      if (provider.response.status == Status.INITIAL) {
        return SliverToBoxAdapter(child: ShimmerLoadingList());
      } else if (provider.response.status == Status.ERROR) {
        return SliverToBoxAdapter(
            child: Center(child: Text('Error: ${provider.response.message}')));
      } else {
        final newsList = provider.response.data as News;

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (cTx, index) {
              final story = newsList.storyList![index];

              if (story.story == null) {
                return Container();
              }

              return InkWell(
                onTap: () =>
                    cTx.push(Routes.newsDetailsPath, extra: story.story!.id),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .03,
                      vertical: size.height * .012),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(.7, .9),
                            color: Colors.black12,
                            blurRadius: 3)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          story.story!.hline!,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        story.story!.intro!,
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        differenceTime(story.story!.pubTime!),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 13),
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: newsList.storyList!.length,
          ),
        );
      }
    });
  }

  differenceTime(String timestamp) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
    final diff = DateTime.now().difference(dateTime);
    int days = diff.inDays;
    int hours = diff.inHours;
    int minutes = diff.inMinutes;
    int seconds = diff.inSeconds;

    if (days > 0) {
      return "$days days ago";
    } else if (hours > 0) {
      return "$hours hrs ago";
    } else if (minutes > 0) {
      return "$minutes mins ago";
    } else {
      return "Just now"; // Or "$seconds seconds ago"
    }
  }
}
