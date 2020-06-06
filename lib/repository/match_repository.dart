import 'package:brasileirao/model/insight.dart';
import 'package:brasileirao/model/match.dart';

abstract class MatchRepository {
  Future<List<Match>> fetchMatchesByRound(int roundNumber);

  Stream<List<Insight>> fetchMatchInsights(String matchId);
}
