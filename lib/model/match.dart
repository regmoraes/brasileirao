import 'package:brasileirao/model/date.dart';
import 'package:equatable/equatable.dart';

import 'score.dart';
import 'team.dart';

class Match extends Equatable implements Comparable<Match> {
  final String id;
  final int round;
  final Team home;
  final Team away;
  final Score score;
  final String date;

  Match({this.id, this.round, this.home, this.away, this.score, this.date});

  @override
  List<Object> get props => [id, round, home, away, score, date];

  factory Match.fromJson(String id, Map<String, dynamic> json) {
    final Score score = json['score'] != null
        ? Score.fromJson(Map<String, dynamic>.from(json['score']))
        : null;

    return Match(
      id: id,
      round: json['round'],
      home: Team.fromJson(Map<String, dynamic>.from(json['home'])),
      away: Team.fromJson(Map<String, dynamic>.from(json['away'])),
      score: score,
      date: json['date'],
    );
  }

  @override
  int compareTo(Match other) {
    final thisDateTime = parseToDateTime(this.date);
    final otherDateTime = parseToDateTime(other.date);
    return thisDateTime.compareTo(otherDateTime);
  }
}

enum MatchHalf { First, Second }
