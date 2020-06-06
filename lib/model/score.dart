import 'package:equatable/equatable.dart';

class Score extends Equatable {
  final int home;
  final int away;

  Score({this.home, this.away});

  @override
  List<Object> get props => [home, away];

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(home: json['home'], away: json['away']);
  }
}
