// Returns topics from the local database
import 'package:data/utility/shared_isar.dart';
import 'package:isar/isar.dart';

import 'local_topic.dart';

class LocalTopicsDatasource {
  Future<List<LocalTopic>> all() async {
    Isar isar = await SharedIsar.instance();
    return isar.localTopics.where().sortByDateTimeDesc().findAll();
  }

  Future<LocalTopic?> fetch(int id) async {
    Isar isar = await SharedIsar.instance();
    return isar.localTopics.get(id);
  }

  Future<void> save(LocalTopic localTopic) async {
    Isar isar = await SharedIsar.instance();
    isar.writeTxn(() async {
      await isar.localTopics.put(localTopic);
    });
  }

  Future<void> delete(int topicId) async {
    Isar isar = await SharedIsar.instance();
    isar.writeTxn(() async {
      await isar.localTopics.delete(topicId);
    });
  }

  Stream<void> watch() {
    return SharedIsar.instance().asStream().asyncExpand((isar) {
      return isar.localTopics.watchLazy();
    });
  }
}
