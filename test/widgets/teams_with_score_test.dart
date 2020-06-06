import 'package:brasileirao/widgets/teams_with_score.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../repository/test_data.dart' as TestData;

void main() {
  group('Given a match that occurred', () {
    final match = TestData.matches[1][0];

    testWidgets('Show teams small name, shield and score', (tester) async {
      await tester.pumpWidget(MaterialApp(home: TeamsWithScore(match)));

      expect(find.text(match.home.shortName), findsOneWidget);
      expect(find.text('${match.score.home}'), findsOneWidget);
      expect(find.text(match.home.fullName), findsNothing);

      expect(find.text(match.home.shortName), findsOneWidget);
      expect(find.text('${match.score.away}'), findsOneWidget);
      expect(find.text(match.away.fullName), findsNothing);

      expect(find.byType(CachedNetworkImage), findsNWidgets(2));
    });
  });

  group('Given a match that did not occurred', () {
    final match = TestData.matches[1][1];

    testWidgets('Do not show the score', (tester) async {
      await tester.pumpWidget(MaterialApp(home: TeamsWithScore(match)));

      expect(find.text(match.home.shortName), findsOneWidget);
      expect(find.text(match.home.fullName), findsNothing);

      expect(find.text(match.home.shortName), findsOneWidget);
      expect(find.text(match.away.fullName), findsNothing);

      expect(find.byType(CachedNetworkImage), findsNWidgets(2));
      expect(find.text(''), findsNWidgets(2));
    });
  });
}
