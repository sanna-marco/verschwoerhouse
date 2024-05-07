import 'package:data/topics/local_topic.dart';
import 'package:data/topics/local_topics_datasource.dart';
import 'package:data/utility/pigeon.g.dart';
import 'package:domain/domain.dart';

// Implements the topics repository where we fetch all topics from
// the local database and return them as well as adding new topics
// to the local storage using the isar database.
class TopicsRepositoryImpl
    implements TopicsRepository, FlutterTopicsRepository {
  final _localTopicsDatasource = LocalTopicsDatasource();

  TopicsRepositoryImpl() : super() {
    FlutterTopicsRepository.setUp(this);
  }

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
              id: localTopic.topicId,
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
  Future<Topic?> fetch(int topicId) async {
    final localTopic = await _localTopicsDatasource.fetch(topicId);
    int? id = localTopic?.topicId;
    String? title = localTopic?.title;
    String? description = localTopic?.description;
    DateTime? dateTime = localTopic?.dateTime;
    if (title != null &&
        description != null &&
        dateTime != null &&
        id != null) {
      return Topic(
          id: id, title: title, dateTime: dateTime, description: description);
    } else {
      return null;
    }
  }

  @override
  Future<void> save(String title, DateTime dateTime, String description) async {
    // Map to local topic
    final LocalTopic localTopic = LocalTopic()
      ..title = title
      ..description = description
      ..dateTime = dateTime;
    // Save to local database
    _localTopicsDatasource.save(localTopic);
  }

  @override
  Future<void> delete(int topicId) async {
    _localTopicsDatasource.delete(topicId);
  }

  @override
  Stream<void> watch() {
    return _localTopicsDatasource.watch();
  }

  // Called from the host (iOS, Android native app)
  @override
  Future<List<PigeonTopic?>> getTopics() async {
    final List<Topic> topics = await all();
    return topics
        .map((topic) => PigeonTopic(
              id: topic.id,
              title: topic.title,
              description: topic.description,
              dateTime: topic.dateTime.toIso8601String(),
            ))
        .toList();
  }
}
