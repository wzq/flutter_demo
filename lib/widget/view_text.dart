import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String text;
  final TextStyle style;
  final EdgeInsetsGeometry padding;
  final int maxLines;

  final double paddingStart;
  final double paddingTop;
  final double paddingEnd;
  final double paddingBottom;

  TextView.create(this.text,
      {this.style,
        this.padding,
        this.maxLines,
        this.paddingBottom = 0,
        this.paddingEnd = 0,
        this.paddingStart = 0,
        this.paddingTop = 0});

  EdgeInsets getEdge() {
    return padding??EdgeInsets.only(
      top: paddingTop,
      left: paddingStart,
      right: paddingEnd,
      bottom: paddingBottom
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getEdge(),
      child: Text(
        text,
        style: style,
        maxLines: maxLines,
      ),
    );
  }
}

