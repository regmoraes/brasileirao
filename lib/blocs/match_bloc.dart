import 'dart:async';

import 'package:brasileirao/blocs/insights_event.dart';
import 'package:brasileirao/repository/match_repository.dart';

import 'match_event.dart';

class MatchBloc {
  final _matchEventController = StreamController<MatchEvent>.broadcast();
  final _insightEventController = StreamController<InsightEvent>.broadcast();
  final MatchRepository _repository;

  Stream<MatchEvent> get matchEvents => _matchEventController.stream;

  Stream<InsightEvent> get insightEvents => _insightEventController.stream;

  MatchBloc(this._repository);

  void fetchMatchesOfRound(int roundNumber) async {
    _matchEventController.add(FetchingMatches());
    final matches = await _repository.fetchMatchesByRound(roundNumber);
    _matchEventController.add(MatchesFetched(matches));
  }

  void fetchMatchInsights(String matchId) async {
    _insightEventController.add(FetchingInsights());
    _repository.fetchMatchInsights(matchId).forEach(
          (insights) => _insightEventController.add(InsightsFetched(insights)),
        );
  }
}
