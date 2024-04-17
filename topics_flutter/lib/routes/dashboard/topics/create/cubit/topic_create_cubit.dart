import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topics_flutter/config/injection.dart';

part 'topic_create_state.dart';

class TopicCreateCubit extends Cubit<TopicCreateState> {
  final _topicsRepository = getIt<TopicsRepository>();

  String title = "";
  String description = "";
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  TopicCreateCubit() : super(InvalidState());

  void updateTitle(String title) {
    this.title = title;
    _validate();
  }

  void updateDescription(String description) {
    this.description = description;
    _validate();
  }

  void updateDate(DateTime dateTime) {
    date = dateTime;
    _validate();
  }

  void updateTime(TimeOfDay timeOfDay) {
    time = timeOfDay;
    _validate();
  }

  Future<void> saveTopic() async {
    emit(LoadingState());
    DateTime dateTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    await _topicsRepository.save(title, dateTime, description);
    emit(SavedState());
  }

  void _validate() {
    if (title.isNotEmpty && description.isNotEmpty) {
      emit(ValidState());
    } else {
      emit(InvalidState());
    }
  }
}
