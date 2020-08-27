import 'package:flutter/material.dart';

class SliverHeaderView extends SliverPersistentHeaderDelegate{
  final Widget child;

  final double minHeight;
  final double maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight ?? 200.0;

  @override
  double get minExtent => minHeight ?? 0.0;

  @override
  bool shouldRebuild(SliverHeaderView oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }

  SliverHeaderView(this.child, {this.maxHeight, this.minHeight});
}