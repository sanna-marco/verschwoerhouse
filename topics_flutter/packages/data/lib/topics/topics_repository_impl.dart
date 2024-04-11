import 'package:data/topics/local_topic.dart';
import 'package:data/topics/local_topics_datasource.dart';
import 'package:data/util/shared_isar.dart';
import 'package:domain/domain.dart';
import 'package:domain/topics/topic.dart';
import 'package:isar/isar.dart';

// Implements the topics repository where we fetch all topics from
// the local database and return them as well as adding new topics
// to the local storage using the isar database.
class TopicsRepositoryImpl implements TopicsRepository {
  final _localTopicsDatasource = LocalTopicsDatasource();

  @override
  Future<List<Topic>> all() async {
    List<LocalTopic> localTopics = await _localTopicsDatasource.all();
    // Map to domain object
    return localTopics
        .map((localTopic) {
          String? title = localTopic.title;
          String? description = localTopic.description;
          DateTime? dateTime = localTopic.dateTime;
          if (title != null && description != null && dateTime != null) {
            return Topic(
              title: title,
              dateTime: dateTime,
              description: description,
            );
          } else {
            return null;
          }
        })
        .whereType<Topic>()
        .toList();
  }

  @override
  Future<void> add(Topic topic) async {
    // Map to local topic
    final LocalTopic localTopic = LocalTopic()
      ..title = topic.title
      ..description = topic.description
      ..dateTime = topic.dateTime;
    // Save to isar
    Isar isar = await SharedIsar.instance();
    isar.writeTxn(() async {
      await isar.localTopics.put(localTopic);
    });
  }
}
