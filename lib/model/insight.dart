import 'package:brasileirao/model/match.dart';
import 'package:equatable/equatable.dart';

class Insight extends Equatable implements Comparable<Insight> {
  final String matchId;
  final int minutes;
  final int seconds;
  final MatchHalf half;
  final String description;
  final bool isGoal;

  Insight(
      {this.matchId,
      this.minutes,
      this.seconds,
      this.half,
      this.description,
      this.isGoal});

  @override
  List<Object> get props => [minutes, seconds, half, description, isGoal];

  factory Insight.fromJson(Map<String, dynamic> json) {
    return Insight(
      matchId: json['matchId'],
      minutes: json['minutes'],
      seconds: json['seconds'],
      half: MatchHalf.values[json['half'] - 1],
      description: json['description'],
      isGoal: json['isGoal'],
    );
  }

  @override
  int compareTo(other) {
    final roundComparision = this.half.index - other.half.index;

    if (roundComparision == 0) {
      final thisDuration =
      Duration(minutes: this.minutes, seconds: this.seconds);
      final otherDuration =
      Duration(minutes: other.minutes, seconds: other.seconds);

      return thisDuration.compareTo(otherDuration);
    } else {
      return roundComparision;
    }
  }
}
