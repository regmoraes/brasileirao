import 'package:brasileirao/model/date.dart';
import 'package:brasileirao/widgets/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchDate extends StatelessWidget {
  final String date;

  const MatchDate(this.date);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Text(
        formatDate(date, format: MATCH_DAY_FORMAT),
        style: matchDateTextStyle,
      ),
    );
  }
}
