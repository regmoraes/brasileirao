import 'package:brasileirao/model/match.dart';
import 'package:brasileirao/model/score.dart';
import 'package:brasileirao/widgets/match_item.dart';
import 'package:brasileirao/widgets/teams_with_score.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../repository/test_data.dart';

void main() {
  group('Given a match that occurred', () {
    final match = Match(
        home: flamengo,
        away: avai,
        score: Score(home: 1, away: 0),
        date: "2020-05-20T16:00:00");

    testWidgets('Show teams with score and date', (tester) async {
      await tester.pumpWidget(MaterialApp(home: MatchItem(match)));

      expect(find.byType(TeamsWithScore), findsOneWidget);
      expect(find.text('qua, 20 mai 2020 às 16:00'), findsOneWidget);
    });
  });
}
