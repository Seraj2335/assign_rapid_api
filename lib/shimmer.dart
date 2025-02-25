// // import 'package:flutter/material.dart';
// //
// // class Shimmer extends StatefulWidget {
// //   static ShimmerState? of(BuildContext context) {
// //     return context.findAncestorStateOfType<ShimmerState>();
// //   }
// //
// //   const Shimmer({
// //     Key? key,
// //     required this.linearGradient,
// //     this.child,
// //   }) : super(key: key);
// //
// //   final LinearGradient linearGradient;
// //   final Widget? child;
// //
// //   @override
// //   ShimmerState createState() => ShimmerState();
// // }
// //
// // class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
// //   late AnimationController _shimmerController;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     _shimmerController = AnimationController.unbounded(vsync: this)
// //       ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));
// //   }
// //
// //   @override
// //   void dispose() {
// //     _shimmerController.dispose();
// //     super.dispose();
// //   }
// //
// //   Listenable get shimmerChanges => _shimmerController;
// //
// //   Gradient get gradient => LinearGradient(
// //     colors: widget.linearGradient.colors,
// //     stops: widget.linearGradient.stops,
// //     begin: widget.linearGradient.begin,
// //     end: widget.linearGradient.end,
// //     transform:
// //     _SlidingGradientTransform(slidePercent: _shimmerController.value),
// //   );
// //
// //   bool get isSized => (context.findRenderObject() as RenderBox).hasSize;
// //
// //   Size get size =>
// //       (context.findRenderObject() as RenderBox?)?.size ?? const Size(30, 89);
// //
// //   Offset getDescendantOffset({
// //     required RenderBox descendant,
// //     Offset offset = Offset.zero,
// //   }) {
// //     final shimmerBox = context.findRenderObject() as RenderBox;
// //     return descendant.localToGlobal(offset, ancestor: shimmerBox);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return widget.child ?? const SizedBox();
// //   }
// // }
// //
// // class _SlidingGradientTransform extends GradientTransform {
// //   const _SlidingGradientTransform({
// //     required this.slidePercent,
// //   });
// //
// //   final double slidePercent;
// //
// //   @override
// //   Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
// //     return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
//

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerClass extends StatelessWidget {
  final Widget child;
  final double height;
  const ShimmerClass({super.key, required this.child,required this.height});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.red,
        child: SizedBox(
          height: height,
            child: child));
  }
}

// import 'package:flutter/material.dart';
//
// class Shimmer extends StatefulWidget {
//   static ShimmerState? of(BuildContext context) {
//     return context.findAncestorStateOfType<ShimmerState>();
//   }
//
//   const Shimmer({
//     Key? key,
//     required this.linearGradient,
//     this.child,
//   }) : super(key: key);
//
//   final LinearGradient linearGradient;
//   final Widget? child;
//
//   @override
//   ShimmerState createState() => ShimmerState();
// }
//
// class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
//   late AnimationController _shimmerController;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _shimmerController = AnimationController.unbounded(vsync: this)
//       ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));
//   }
//
//   @override
//   void dispose() {
//     _shimmerController.dispose();
//     super.dispose();
//   }
//
//   Listenable get shimmerChanges => _shimmerController;
//
//   Gradient get gradient => LinearGradient(
//     colors: widget.linearGradient.colors,
//     stops: widget.linearGradient.stops,
//     begin: widget.linearGradient.begin,
//     end: widget.linearGradient.end,
//     transform:
//     _SlidingGradientTransform(slidePercent: _shimmerController.value),
//   );
//
//   bool get isSized => (context.findRenderObject() as RenderBox).hasSize;
//
//   Size get size =>
//       (context.findRenderObject() as RenderBox?)?.size ?? const Size(30, 89);
//
//   Offset getDescendantOffset({
//     required RenderBox descendant,
//     Offset offset = Offset.zero,
//   }) {
//     final shimmerBox = context.findRenderObject() as RenderBox;
//     return descendant.localToGlobal(offset, ancestor: shimmerBox);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return widget.child ?? const SizedBox();
//   }
// }
//
// class _SlidingGradientTransform extends GradientTransform {
//   const _SlidingGradientTransform({
//     required this.slidePercent,
//   });
//
//   final double slidePercent;
//
//   @override
//   Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
//     return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
//   }
// }
