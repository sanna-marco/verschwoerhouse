import 'topic.dart';

// Returns a list of all topics
abstract class TopicsRepository {
  // Future list, asyncronously fetched
  Future<List<Topic>> all();
  // Adds a topic
  Future<void> add(Topic topic);
  // Observes changes in the database
  Stream<void> watch();
}
