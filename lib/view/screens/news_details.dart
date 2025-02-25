import 'package:assign_linkdin/model/apis/end_points.dart';
import 'package:assign_linkdin/model/models/news_details_model.dart';
import 'package:assign_linkdin/view_model/cricket_view_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsDetails extends StatelessWidget {
  final int newsId;

  const NewsDetails({super.key, required this.newsId});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CricketViewProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<NewsDetailsModel>(
          future: provider
              .fetchNewsDetails(ApiEndPoint(value: newsId).newsDetails()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.red),
              ));
            } else if (snapshot.hasData) {
              final newsDetails = snapshot.data!;
              return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: size.height * .22,
                    floating: false,
                    pinned: true,
                    snap: false,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(newsDetails.headline),
                      background: Image.network(
                        'https://picsum.photos/500/300', // Background image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // SliverList(
                  //     delegate: SliverChildListDelegate(List.generate(
                  //         newsDetails.content.length,
                  //         (index) => Text(newsDetails
                  //             .content.length.toString())))),
                ],
              );
            } else {
              return const SliverToBoxAdapter(
                child: Center(child: Text('No data available')),
              );
            }
          }),
    );
  }

  Padding buildPadding(Size size, Widget child) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .03, vertical: size.height * .02),
      child: child,
    );
  }
}
