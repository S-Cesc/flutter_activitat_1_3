import 'string_extensions.dart';

enum DateDayName {
  daysBeforeYesterday(null),
  theDayBeforeYesterday("abans d'ahir"),
  yesterday("ahir"),
  today("avui"),
  tomorrow("demà"),
  theDayAfterTomorrow("demà passat"),
  daysAfterTomorrow(null);

  const DateDayName(this.name);

  final String? name;

  String? capitalizedName() {
    return name?.capitalize();
  }

  static bool isSameDay(DateTime d1, DateTime d2) =>
      d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;

  static DateTime getYesterday(DateTime today) =>
      today.add(const Duration(days: -1));

  static bool isYesterday(DateTime date, DateTime today) {
    return isSameDay(date, getYesterday(today));
  }

  static DateTime getTomorrow(DateTime today) =>
      today.add(const Duration(days: 1));

  static bool isTomorrow(DateTime date, DateTime today) {
    return isSameDay(date, getTomorrow(today));
  }

  factory DateDayName.fromDate(DateTime d) {
    final now = DateTime.now();
    if (isSameDay(d, now)) {
      return DateDayName.today;
    } else if (d.isBefore(now)) {
      final yesterday = getYesterday(now);
      if (isSameDay(d, yesterday)) {
        return DateDayName.yesterday;
      } else {
        final dayBefore = getYesterday(yesterday);
        if (isSameDay(d, dayBefore)) {
          return DateDayName.theDayBeforeYesterday;
        } else {
          return DateDayName.daysBeforeYesterday;
        }
      }
    } else {
      final tomorrow = getTomorrow(now);
      if (isSameDay(d, tomorrow)) {
        return DateDayName.tomorrow;
      } else {
        final dayAfter = getTomorrow(tomorrow);
        if (isSameDay(d, dayAfter)) {
          return DateDayName.theDayAfterTomorrow;
        } else {
          return DateDayName.daysAfterTomorrow;
        }
      }
    }
  }
}
