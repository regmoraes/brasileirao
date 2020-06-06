import 'package:brasileirao/blocs/insights_event.dart';
import 'package:brasileirao/blocs/match_bloc.dart';
import 'package:brasileirao/model/match.dart';
import 'package:brasileirao/widgets/loading.dart';
import 'package:brasileirao/widgets/match_insights.dart';
import 'package:brasileirao/widgets/no_insights.dart';
import 'package:brasileirao/widgets/teams_with_score.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MatchInsightsPage extends StatefulWidget {
  final Match match;

  const MatchInsightsPage(this.match);

  @override
  _MatchInsightsPageState createState() => _MatchInsightsPageState();
}

class _MatchInsightsPageState extends State<MatchInsightsPage> {
  MatchBloc matchBloc;

  @override
  void initState() {
    matchBloc = Provider.of<MatchBloc>(context, listen: false);
    matchBloc.fetchMatchInsights(widget.match.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "${widget.match.home.fullName} x ${widget.match.away.fullName}",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TeamsWithScore(widget.match),
            Container(
              margin: EdgeInsets.only(top: 8, bottom: 8),
            ),
            Expanded(
              child: StreamBuilder(
                stream: matchBloc.insightEvents,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final insightEvent = snapshot.data;

                    if (insightEvent is InsightsFetched) {
                      if (insightEvent.insights.isEmpty)
                        return const NoInsights();
                      else
                        return MatchInsights(insightEvent.insights);
                    } else
                      return const Loading();
                  } else {
                    return const NoInsights();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
