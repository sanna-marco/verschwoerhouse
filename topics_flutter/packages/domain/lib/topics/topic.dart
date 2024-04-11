import 'package:flutter/foundation.dart';

@immutable
class Topic {
  final String title;
  final DateTime dateTime;
  final String description;

  const Topic({
    required this.title,
    required this.dateTime,
    required this.description,
  });
}
