import 'package:brasileirao/model/match.dart';
import 'package:brasileirao/pages/match_insights_page.dart';
import 'package:brasileirao/pages/navigator.dart';
import 'package:flutter/material.dart';

import 'match_item.dart';

class Matches extends StatelessWidget {
  final List<Match> matches;

  Matches(this.matches);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey,
      ),
      itemCount: matches.length,
      itemBuilder: (context, index) => GestureDetector(
        child: MatchItem(matches[index]),
        onTap: () => push(context, MatchInsightsPage(matches[index])),
      ),
    );
  }
}
