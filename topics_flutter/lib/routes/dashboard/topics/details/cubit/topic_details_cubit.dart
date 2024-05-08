import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:topics_flutter/config/injection.dart';

part 'topic_details_state.dart';

class TopicDetailsCubit extends Cubit<TopicDetailsState> {
  final _topicsRepository = getIt<TopicsRepository>();

  TopicDetailsCubit() : super(ZeroState());

  void loadTopic(int id) async {
    emit(LoadingState());
    final topic = await _topicsRepository.fetch(id);
    if (topic != null) {
      // Randomizing the color
      final colors = ['black', 'green', 'lila', 'pink', 'yellow'];
      final random = Random();
      final color = colors[random.nextInt(colors.length)];
      emit(LoadedState(topic, color));
    } else {
      emit(ErrorState());
    }
  }
}
