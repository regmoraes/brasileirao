import 'package:brasileirao/blocs/match_bloc.dart';
import 'package:brasileirao/blocs/match_event.dart';
import 'package:brasileirao/widgets/loading.dart';
import 'package:brasileirao/widgets/matches.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MatchesPage extends StatefulWidget {
  @override
  _MatchesPageState createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  MatchBloc matchesBloc;
  int round;

  @override
  void initState() {
    matchesBloc = Provider.of<MatchBloc>(context, listen: false);
    matchesBloc.fetchMatchesOfRound(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brasileirão'),
      ),
      body: Container(
        child: StreamBuilder<MatchEvent>(
          stream: matchesBloc.matchEvents,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              final event = snapshot.data;

              if (event is FetchingMatches) {
                return Loading();
              }

              if (event is MatchesFetched) {
                return Matches(event.matches);
              }
            }
            return Container();
          },
        ),
      ),
    );
  }
}
