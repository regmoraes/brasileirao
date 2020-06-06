import 'package:equatable/equatable.dart';

class Team extends Equatable {
  final String fullName;
  final String shortName;
  final String shield;

  Team({this.fullName, this.shortName, this.shield});

  @override
  List<Object> get props => [fullName, shortName, shield];

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      fullName: json['fullName'],
      shortName: json['shortName'],
      shield: json['shield'],
    );
  }
}
