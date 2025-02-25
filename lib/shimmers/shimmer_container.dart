import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.all(size.width * .02),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ShimmerClass(
            height: size.height * .18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.black12,
                  height: size.height * .03,
                  width: size.width,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.black12,
                  height: size.height * .06,
                  width: size.width,
                ),
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
          ),
        ));
  }
}
