import 'package:brasileirao/model/insight.dart';
import 'package:brasileirao/model/match.dart';
import 'package:brasileirao/repository/match_repository.dart';

import 'test_data.dart';

class InMemory implements MatchRepository {
  @override
  Future<List<Match>> fetchMatchesByRound(int roundNumber) {
    return Future.value(matches[roundNumber]);
  }

  @override
  Stream<List<Insight>> fetchMatchInsights(String matchId) {
    return Stream.value(insights[matchId]);
  }
}
