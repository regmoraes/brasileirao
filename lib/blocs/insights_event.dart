import 'package:brasileirao/model/insight.dart';
import 'package:equatable/equatable.dart';

abstract class InsightEvent extends Equatable {}

class FetchingInsights extends InsightEvent {
  @override
  List<Object> get props => [];
}

class InsightsFetched extends InsightEvent {
  final List<Insight> insights;

  InsightsFetched(this.insights);

  @override
  List<Object> get props => [insights];
}

class FetchInsightError extends InsightEvent {
  @override
  List<Object> get props => [];
}
