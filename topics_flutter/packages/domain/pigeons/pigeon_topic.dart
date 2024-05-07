import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: '../data/lib/utility/pigeon.g.dart',
  dartOptions: DartOptions(),
  swiftOut:
      '../../../topics_swiftui/topics/packages/data/Sources/utility/Pigeon+Generated.swift',
  swiftOptions: SwiftOptions(),
  kotlinOut:
      '../../../topics_android/app/src/main/java/com/marcosanna/topics/util/Pigeon.g.kt',
  kotlinOptions: KotlinOptions(),
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
  @async
  List<PigeonTopic> getTopics();
}
