import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: '../data/lib/utility/pigeon.g.dart',
  dartOptions: DartOptions(),
  swiftOut: '../../../topics_swiftui/topics/utility/Pigeon+Generated.swift',
  swiftOptions: SwiftOptions(),
  dartPackageName: 'domain',
))
class PigeonTopic {
  final int id;
  final String title;
  final String description;
  final String dateTime;

  PigeonTopic({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
  });
}

@FlutterApi()
abstract class FlutterTopicsRepository {
  List<PigeonTopic> getTopics();
}
