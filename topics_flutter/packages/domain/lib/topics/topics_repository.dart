import 'topic.dart';

// Returns a list of all topics
abstract class TopicsRepository {
  // Future list, asyncronously fetched
  Future<List<Topic>> all();
  // Future single topic by id
  Future<Topic?> fetch(int topicId);
  // Saves a topic to local storage
  Future<void> save(String title, DateTime dateTime, String description);
  // Observes changes in the database
  Stream<void> watch();
}
