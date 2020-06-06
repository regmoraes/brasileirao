import 'package:brasileirao/model/insight.dart';
import 'package:brasileirao/model/match.dart';
import 'package:brasileirao/widgets/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchInsightCard extends StatelessWidget {
  final Insight insight;

  const MatchInsightCard(this.insight);

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width / 2;

    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "${formatMatchTime(insight.minutes, insight.seconds)}",
                style: matchTimeTextStyle,
              ),
              Center(child: Text("${parseMatchHalf(insight.half)} tempo")),
            ],
          ),
          Container(
            width: cardWidth,
            child: Card(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Text(insight.description),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

String parseMatchHalf(MatchHalf matchHalf) {
  if (matchHalf == MatchHalf.First)
    return "1º";
  else
    return "2º";
}

String formatMatchTime(int minutes, int seconds) {
  final secondsFormatted = '$seconds'.padLeft(2, '0');
  return "$minutes' $secondsFormatted''";
}
