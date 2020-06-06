import 'package:brasileirao/model/insight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'match_insight_card.dart';

class MatchInsights extends StatelessWidget {
  final List<Insight> insights;

  const MatchInsights(this.insights);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: insights?.length ?? 0,
        itemBuilder: (context, index) => MatchInsightCard(insights[index]),
      ),
    );
  }
}
