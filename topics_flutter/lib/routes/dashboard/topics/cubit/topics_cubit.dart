import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/injection.dart';

part 'topics_state.dart';

class TopicsCubit extends Cubit<TopicsState> {
  final _topicsRepository = getIt<TopicsRepository>();
  TopicsCubit() : super(ZeroState()) {
    _topicsRepository.watch().listen((_) {
      emit(ChangedState());
    });
  }

  void loadTopics() async {
    emit(LoadingState());
    final List<Topic> topics = await _topicsRepository.all();
    if (topics.isEmpty) {
      emit(EmptyState());
    } else {
      emit(LoadedState(topics));
    }
  }

  void addTopic(String title, String description, DateTime dateTime) async {
    emit(LoadingState());
    final topic = Topic(
      title: title,
      dateTime: dateTime,
      description: description,
    );
    await _topicsRepository.add(topic);
    loadTopics();
  }
}
