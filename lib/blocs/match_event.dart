import 'package:brasileirao/model/match.dart';
import 'package:equatable/equatable.dart';

abstract class MatchEvent extends Equatable {}

class FetchingMatches extends MatchEvent {
  @override
  List<Object> get props => [];
}

class MatchesFetched extends MatchEvent {
  final List<Match> matches;

  MatchesFetched(this.matches);

  @override
  List<Object> get props => [matches];
}

class FetchMatchesError extends MatchEvent {
  @override
  List<Object> get props => [];
}
