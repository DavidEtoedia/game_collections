import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int? starCount;
  final bool
      allowHalfRating; //this is needed only when having fullRatedIconData && halfRatedIconData
  final double spacing;
  const StarRating({
    Key? key,
    this.starCount = 5,
    this.allowHalfRating = true,
    this.spacing = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Wrap(
          alignment: WrapAlignment.start,
          spacing: spacing,
          children: List.generate(starCount!, (index) {
            return const Icon(
              Icons.star,
              color: Colors.yellow,
              size: 15,
            );
          })),
    );
  }
}
