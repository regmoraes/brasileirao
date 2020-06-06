import 'package:brasileirao/model/insight.dart';
import 'package:brasileirao/model/match.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:brasileirao/secrets.dart';
import 'match_repository.dart';

class FirebaseRealtimeDb implements MatchRepository {
  FirebaseDatabase _database;

  FirebaseRealtimeDb._(this._database);

  @override
  Future<List<Match>> fetchMatchesByRound(int roundNumber) async {
    final DataSnapshot snapshot = await _database
        .reference()
        .child('matches')
        .orderByChild('round')
        .equalTo(roundNumber)
        .once();

    final Map matchDataMap = snapshot.value;

    final matches = matchDataMap?.entries
            ?.map((matchData) => Match.fromJson(
                matchData.key, Map<String, dynamic>.from(matchData.value)))
            ?.toList() ??
        List();

    matches.sort((first, second) => first.compareTo(second));

    return matches;
  }

  @override
  Stream<List<Insight>> fetchMatchInsights(String matchId) {
    final Stream<Event> eventStream = _database
        .reference()
        .child('insights')
        .orderByChild('matchId')
        .equalTo(matchId)
        .onValue;

    return eventStream.map((event) {
      final Map insightDataMap = event.snapshot.value;

      final insights = insightDataMap?.values
              ?.map((insightData) =>
                  Insight.fromJson(Map<String, dynamic>.from(insightData)))
              ?.toList() ??
          List();

      insights.sort((first, second) => first.compareTo(second));

      return insights;
    });
  }

  static Future<FirebaseRealtimeDb> instance() async {
    final firebaseApp = await FirebaseApp.configure(
      name: 'brasileirao',
      options: const FirebaseOptions(
        googleAppID: GOOGLE_APP_ID,
        apiKey: API_KEY,
        databaseURL: DATABASE_URL,
      ),
    );

    final _database = FirebaseDatabase(app: firebaseApp);
    await _database.setPersistenceEnabled(true);
    await _database.setPersistenceCacheSizeBytes(2000000);

    return FirebaseRealtimeDb._(_database);
  }
}
