import 'package:flutter_exam/domain/enums/locale_language.dart';
import 'package:intl/intl.dart';

class LocalFormat {
  LocalFormat._internal();

  static final LocalFormat _instance = LocalFormat._internal();
  static LocalFormat get instance => _instance;

  static Language defaultLocale = Language.en;

  String _getLocale(Language? locale) {
    return (locale ?? defaultLocale).name;
  }

  String formattDateNumber(DateTime date, {Language? locale}) {
    return DateFormat("dd/MMMM/y", _getLocale(locale)).format(date);
  }

  String formattDateMonth(DateTime date, {Language? locale}) {
    return DateFormat("dd MMMM", _getLocale(locale)).format(date);
  }

  String formattMonth(DateTime date, {Language? locale}) {
    return DateFormat("MMMM", _getLocale(locale)).format(date);
  }

  String formattDate(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date);
  }

  String formattDateWithMonth(DateTime date, {Language? locale}) {
    String day = DateFormat("dd", _getLocale(locale)).format(date);
    String month = DateFormat("MMMM", _getLocale(locale)).format(date);
    String year = DateFormat("y", _getLocale(locale)).format(date);
    return '$day de $month del $year.';
  }
}
