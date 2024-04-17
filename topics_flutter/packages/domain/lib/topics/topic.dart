import 'package:flutter/foundation.dart';

@immutable
class Topic {
  final int id;
  final String title;
  final DateTime dateTime;
  final String description;

  const Topic({
    required this.id,
    required this.title,
    required this.dateTime,
    required this.description,
  });
}
