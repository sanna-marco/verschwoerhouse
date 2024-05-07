import 'package:data/data.dart';
import 'package:data/utility/pigeon.g.dart';
import 'package:domain/domain.dart';

import 'injection.dart';

void configurePigeon() {
  // Instantiate pigeon engine
  FlutterTopicsRepository.setUp(getIt<FlutterTopicsRepository>());
}
