import 'package:brasileirao/model/insight.dart';
import 'package:brasileirao/model/match.dart';
import 'package:brasileirao/widgets/match_insight_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Given an Insight', () {
    final insight = Insight(
        minutes: 25,
        seconds: 30,
        half: MatchHalf.First,
        description: "Escanteio",
        isGoal: false);

    testWidgets('It should show insight minutes, seconds and half info ',
            (tester) async {
          await tester.pumpWidget(MaterialApp(home: MatchInsightCard(insight)));

          expect(find.text("25' 30'' do 1º tempo"), findsOneWidget);
          expect(find.text("Escanteio"), findsOneWidget);
        });
  });
}
