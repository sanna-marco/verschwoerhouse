import 'package:isar/isar.dart';
part 'local_topic.g.dart';

@collection
class LocalTopic {
  Id topicId = Isar.autoIncrement;

  String? title;
  DateTime? dateTime;
  String? description;
}
