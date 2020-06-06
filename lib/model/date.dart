import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const ISO8601_FORMAT = "yyyy-MM-ddTHH:mm";
const MATCH_DAY_FORMAT = "EEE, d MMM y 'às' H:mm";

String formatDate(String date, {String format = ISO8601_FORMAT}) {
  final dateTime = parseToDateTime(date);
  final formattedDate = DateFormat(format, 'pt_Br').format(dateTime);

  return "$formattedDate";
}

DateTime parseToDateTime(String date) {
  initializeDateFormatting();
  return DateTime.tryParse(date);
}
