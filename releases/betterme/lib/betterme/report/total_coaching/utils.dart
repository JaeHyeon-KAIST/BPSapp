// // Copyright 2019 Aleksander Woźniak
// // SPDX-License-Identifier: Apache-2.0

// import 'dart:collection';

// import 'package:table_calendar/table_calendar.dart';

// /// Example event class.
// class Event {
//   final String title;

//   const Event(this.title);

//   @override
//   String toString() => title;
// }

// /// Example events.
// ///
// /// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
// final kEvents = LinkedHashMap<DateTime, List<Event>>(
//   equals: isSameDay,
//   hashCode: getHashCode,
// )..addAll(_kEventSource);

// final _kEventSource = Map.fromIterable(
//   List.generate(50, (index) => index),
//   key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
//   value: (item) => List.generate(
//       item % 4 + 1, (index) => Event('Event $item | ${index + 1}')),
// );

// int getHashCode(DateTime key) {
//   return key.day * 1000000 + key.month * 10000 + key.year;
// }

// final kToday = DateTime.now();
// final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
// final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_events);
// )..addAll(_kEventSource);

Map<DateTime, List<Event>> _events = {
  // DateTime.utc(2021, 12, 12): [Event('Event 1')],
  // DateTime.utc(2021, 12, 11): [],
  // DateTime.utc(2021, 12, 21): [Event('Event 1'), Event('Event 2')],
  // DateTime.utc(2021, 12, 28): [Event('Event 1')],
  // DateTime.utc(2021, 12, 31): [Event('Event 1!')],
};

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

//
final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
