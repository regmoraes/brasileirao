import 'package:brasileirao/widgets/match_date.dart';
import 'package:brasileirao/widgets/teams_with_score.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/match.dart';

class MatchItem extends StatelessWidget {
  final Match match;

  const MatchItem(this.match);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[TeamsWithScore(match), MatchDate(match.date)],
      ),
    );
  }
}
