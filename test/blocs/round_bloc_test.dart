import 'package:brasileirao/blocs/insights_event.dart';
import 'package:brasileirao/blocs/match_bloc.dart';
import 'package:brasileirao/blocs/match_event.dart';
import 'package:flutter_test/flutter_test.dart';

import '../repository/in_memory.dart';
import '../repository/test_data.dart' as TestData;

void main() {
  final repository = InMemory();
  final roundBloc = MatchBloc(repository);

  group('Given a repository with matches', () {
    test(
        'When fetch matches is called for a round it should emit fetching and fetched',
        () {
      final expectedMatches = TestData.matches[1];
      final expectedEvents = [
        FetchingMatches(),
        MatchesFetched(expectedMatches)
      ];

      expectLater(roundBloc.matchEvents, emitsInOrder(expectedEvents));

      roundBloc.fetchMatchesOfRound(1);
    });
  });

  group("Given a matchId", () {
    final matchId = "1";

    test('When fetching insights for match it should emit fetching and fetched',
        () {
      final expectedEvents = [
        FetchingInsights(),
        InsightsFetched(TestData.insights[matchId])
      ];

      expectLater(roundBloc.insightEvents, emitsInOrder(expectedEvents));

      roundBloc.fetchMatchInsights(matchId);
    });
  });
}
