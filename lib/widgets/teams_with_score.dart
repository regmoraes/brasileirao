import 'package:brasileirao/widgets/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/match.dart';

class TeamsWithScore extends StatelessWidget {
  final Match match;

  const TeamsWithScore(this.match);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text("${match.home.shortName}"),
        CachedNetworkImage(imageUrl: match.home.shield),
        _buildScoreWidget(match.score?.home),
        Text(" X "),
        _buildScoreWidget(match.score?.away),
        CachedNetworkImage(imageUrl: match.away.shield),
        Text("${match.away.shortName}"),
      ],
    );
  }
}

final Widget Function(int) _buildScoreWidget = (score) {
  if (score == null) {
    return Text('');
  } else {
    return Text(
      "$score",
      style: scoreTextStyle,
    );
  }
};
