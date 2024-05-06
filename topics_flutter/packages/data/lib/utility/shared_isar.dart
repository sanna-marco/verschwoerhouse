import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../topics/local_topic.dart';

// Shares access to the isar database, so we only use one
// instance
class SharedIsar {
  static Isar? _instance;

  static Future<Isar> instance() async {
    if (_instance != null) {
      return Future.value(_instance);
    } else {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
        [LocalTopicSchema],
        directory: dir.path,
      );
      _instance = isar;
      return isar;
    }
  }
}
