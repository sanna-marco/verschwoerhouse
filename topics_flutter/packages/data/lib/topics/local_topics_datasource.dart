// Returns topics from the local database
import 'package:data/util/shared_isar.dart';
import 'package:isar/isar.dart';

import 'local_topic.dart';

class LocalTopicsDatasource {
  Future<List<LocalTopic>> all() async {
    Isar isar = await SharedIsar.instance();
    return isar.localTopics.where().sortByDateTime().findAll();
  }
}
